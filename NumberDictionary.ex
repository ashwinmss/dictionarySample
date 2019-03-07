#AUTHORED BY : M.S.Ashwin
#Date : 8th March 2019


defmodule NumberDictionary do
	#This is the function to be called to get the list of possible words from the dictionary pointing to the number
	#Eg: 
	#	NumberDictionary.get_key_words(6686787825, "new.txt") results in 
	#	["VUM", "VULVAS", "VULVAR", "VULVAL", "VULVA", "VULTUROUS", "VROOMS", "VROOM",
	#	 "VOLVULUS", "VOLVAS", "VOLVA", "VOLUPTUOUS", "VOLTS", "VOLTA", "VOLT",
	#	 "VOLOSTS", "VOLOST", "VOLCANOS", "VOLCANO", "VOLAR", "VOLANT", "VOCALS",
	#	 "VOCAL", "VOCABULAR", "VOCABS", "VOCAB", "VAVS", "VAVASSORS", "VAVASSOR",
	#	 "VAVASOURS", "VAVASOUR", "VAVASORS", "VAVASOR", "VAV", "VAUS", "VAUNTS",
	#	 "VAUNT", "VAULTS", "VAULT", "VAU", "VATUS", "VATU", "VATS", "VAT", "VASTS",
	#	 "VAST", "VASSALS", "VASSAL", "VASOSPASMS", "VASOSPASM", ...]
	def get_key_words(number, path) do
		list = String.codepoints(to_string(number))
		list2 = getMappedChars(list)
		case File.read(path) do
			{:ok, contents} ->
				words = String.split(contents, "\r\n")
				find(words, list2)
			{:error, reason} ->
				reason
		end
	end

	#this function returns the list of alphabets mapped to the digits of the number
	def getMappedChars(numberList) do
		getMappedChars(numberList, [])
	end

	def getMappedChars([h | r], acc) do
		map = %{2 => ["a", "b", "c"], 3 => ["d", "e", "f"], 4 => ["g", "h", "i"], 5 => ["j", "k", "l"], 6 => ["m", "n", "o"], 7 => ["p", "q", "r", "s"], 8 => ["t", "u", "v"], 9 => ["w", "x", "y", "z"]}
		{num,_} = Integer.parse(h)
		char = map[num]
		#IO.puts acc
		case Enum.member?(acc, char) do
			true -> getMappedChars(r, acc)
			_ ->
				getMappedChars(r, [char | acc])
		end
	end
	
	def getMappedChars([], acc) do
		joinChars(acc)
	end
	######################################
	
	#This joins the list of alphabets pointing to each digit, into a single list
	def joinChars(l) do
		joinChars(l, [])
	end
	
	def joinChars([h | r], acc) do
		joinChars(r, acc ++ h)
	end
	
	def joinChars([], acc) do
		acc
	end
	#######################################

	#This function recursively runs through each word in the dictionary and checks if all alphabets of the word are a part of the list of #alphabets pointing to the number
	def find(l, alphabets) do
		find(l, alphabets, [])
	end

	def find([word | r], alphabets, acc) do
		case String.length(word) >= 3 do
			true ->
				case does_list_contain(String.codepoints(String.downcase(word)), alphabets) do
					true -> find(r, alphabets, [word | acc])
					false -> find(r, alphabets, acc)
				end
			false -> find(r, alphabets, acc)
		end
	end
	
	def find([], _, acc) do
		acc
	end
	######################################
	
	#A helper function to 'find' function
	def does_list_contain([h | r], l) do
		case Enum.member?(l, h) do
			true -> 
				does_list_contain(r, l)
			false -> false
		end
	end
	
	def does_list_contain([], l) do
		true
	end
	######################################
end

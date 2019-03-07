# dictionarySample
Given a 10 digit phone number this results in a combination of words from a provided dictionary,  like 1-800-motortruck which is easier to remember then 1-800-6686787825

This module exposes a function to return the list of all possible words from the dictionary, that can point to a number

Sample Input :
================
  NumberDictionary.get_key_words(6686787825, "new.txt")
 
Sample Output : 
================
  ["VUM", "VULVAS", "VULVAR", "VULVAL", "VULVA", "VULTUROUS", "VROOMS", "VROOM", "VOLVULUS", "VOLVAS", "VOLVA", "VOLUPTUOUS", "VOLTS", "VOLTA", "VOLT", "VOLOSTS", "VOLOST", "VOLCANOS", "VOLCANO", "VOLAR", "VOLANT", "VOCALS", "VOCAL", "VOCABULAR", "VOCABS", "VOCAB", "VAVS", "VAVASSORS", "VAVASSOR", "VAVASOURS", "VAVASOUR", "VAVASORS", "VAVASOR", "VAV", "VAUS", "VAUNTS", "VAUNT", "VAULTS", "VAULT", "VAU", "VATUS", "VATU", "VATS", "VAT", "VASTS", "VAST", "VASSALS", "VASSAL", "VASOSPASMS", "VASOSPASM", ...]

Assumptions : 
==============

  The phone number mapping to letters is as follows:
    2 = a b c
    3 = d e f
    4 = g h i
    5 = j k l
    6 = m n o
    7 = p q r s
    8 = t u v
    9 = w x y z
    
    For the numbers 0 and 1, it is considered as empty
    
    

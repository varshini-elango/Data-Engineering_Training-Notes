def capitalize (sentence):
    return  ' '.join(word.capitalize() for word in sentence.split())

def reverse(s):
    return s[::-1]

def count_vowels(s):
    vowels = 'aeiouAEIOU'
    return sum(1 for char in s if char in vowels)

def is_palindrome(s):
    s = s.replace(" ", "").lower()
    return s == s[::-1]

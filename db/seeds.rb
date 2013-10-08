Palindrome.delete_all
Site.delete_all

new_pal = Palindrome.create(text: 'racecar')

new_site = Site.create(url: 'none')

new_pal.sites << new_site
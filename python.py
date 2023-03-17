import phonenumbers
from phonenumbers import geocoder
phone_number1 = phonenumbers.parse("+918296581864")

print("\nPhone. Numbers Location\n")
print(geocoder.description_for_number(phone_number1,"en"));
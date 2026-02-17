#  .\Activate.ps1           dentro de Script

# PRINT Y BASICOS
name = "albaro"
edad = 23
print(f"hola {name} sorete viejo {edad}")


num1 = 10
num2 = 20

res = num1 * num2
print(f"El resultado es: {res}")

# CONDICIONALES
if res > 100:
    print("El resultado es mayor que 100")
elif res == 100:
    print("El resultado es igual a 100")
else:
    print("El resultado es menor que 100")


if res > 10 and res < 50:
    print("Resultado entre 10 y 50")
elif res > 100 or res < 0:
    print("El resultado es mayor a 100 o menor que 0")

if res % 2 == 0:
    print("El resultado es par")
else:
    print("Es impar")
    
if res % 2 != 0:
    print("El resultado es impar")
else:
    print("Es par")

text1 = "Hola "
text2 = "Mundo"

frase = text1 + text2
if type(frase) == str or len(frase) > 10:
    print("Es una frase con mas de 10 caracteres")

# Create a while condition, guess a secret number between 1 and 10
secret_number = 7
guess = 0
tries = 0

while guess != secret_number and tries < 3:
    guess = int(input("Adivina el número secreto (entre 1 y 10): "))
    tries += 1
    if guess < secret_number:
        print("Demasiado bajo")
    elif guess > secret_number:
        print("Demasiado alto")
    else:
        print("¡Felicidades! Adivinaste el número secreto.")
if tries >=3:
    print("Lo siento, no adivinaste el número secreto.")


# Count the number of even from a series of numbers
counter = 0
for i in range(1, 11):
    if i % 2 == 0:
        counter += 1
print(f"El número de números pares es: {counter}")

# codigo para ver si un año es bisiesto en un bucle
while True:
    year = int(input("Ingrese un año (0 para salir): "))
    if year == 0:
        break
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        print(f"El año {year} es bisiesto")
    else:
        print(f"El año {year} no es bisiesto")
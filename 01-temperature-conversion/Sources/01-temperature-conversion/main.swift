/*
 * Creates a constant holding any temperature in Celsius.
 * Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 * Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */

import Foundation

var temperatureInCelsius = 44.0
var temperatureInFahrenheit = (( temperatureInCelsius * 9) / 5 ) + 32
print("\(temperatureInCelsius)°C / \(temperatureInFahrenheit)°F")

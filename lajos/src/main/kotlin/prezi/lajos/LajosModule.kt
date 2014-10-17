package prezi.lajos

import prezi.bela.BelaModule
import prezi.bela.Dummy
import prezi.bela.Values

object LajosModule {
	fun makeMeADummy(): Dummy {
		return BelaModule.makeMeADummy()
	}
	fun main() {
		var dummy = makeMeADummy()
		console.log("Hello Kotlin!")
		console.log("This is Spaghetti " + Spaghetti.getSpaghettiVersion() + " with Kotlin support!")
		console.log("10 + 20 = : " + dummy.add(10, 20))
		console.log("Ordinal of ALMA: " + Values.ALMA + " (something = " + Constants.SOMETHING + ")")
		var point:Point<Int> = object {
			val x = 10
			val y = 20
			fun length():Int {
				val square = x * x + y * y
				return Math.sqrt(square.toDouble()).toInt()
			}
		} as Point<Int>
		console.log("Point", dummy.identity(point), "length =", point.length());
		dummy.callback(12, { value ->
			console.log("Callback called with", value)
		})
	}
}

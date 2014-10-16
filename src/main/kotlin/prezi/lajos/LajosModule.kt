package prezi.lajos

object LajosModule {
	fun makeMeADummy(): Dummy {
		return DummyImpl()
	}
	fun main() {
		var dummy = makeMeADummy()
		console.log("Hello Kotlin!")
		console.log("This is Spaghetti " + Spaghetti.getSpaghettiVersion())
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
	}
}

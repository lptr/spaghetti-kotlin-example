package prezi.lajos

object LajosModule {
	fun makeMeADummy(): Dummy {
		return DummyImpl()
	}
	fun main() {
		console.log("Hello Kotlin!")
		console.log("This is Spaghetti " + Spaghetti.getSpaghettiVersion())
		console.log("10 + 20 = : " + makeMeADummy().add(10, 20))
	}
}

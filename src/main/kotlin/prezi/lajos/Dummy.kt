package prezi.lajos

class DummyImpl : Dummy {
	override fun add(a:Int, b:Int):Int {
		return a + b
	}

	override fun ordinal(value:Int):Int {
		return value;
	}
}

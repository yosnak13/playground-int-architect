@IsTest
private class MyIterableTest {
	@IsTest
    static void testIterableForLoop() {
        List<String> strings = new List<String>{
            'Hello',
            'World'
        };

        MyIterable actual = new MyIterable(strings);
        for (String s : actual) {
            System.debug(s);
        }
    }
}
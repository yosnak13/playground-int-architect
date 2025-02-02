/**
 * Created by yosnak13 on 2025/02/02.
 */

@IsTest
private class AnimalLocatorTest {

  private static final Integer ANIMAL_ID = 1;

  @IsTest
  static void getAnimalNameByIdTest() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
    String actual = AnimalLocator.getAnimalNameById(ANIMAL_ID);
    System.assertEquals('Mike', actual);

  }
}
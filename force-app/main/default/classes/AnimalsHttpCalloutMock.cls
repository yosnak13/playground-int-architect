/**
 * Created by yosnak13 on 2025/01/22.
 */

@IsTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock {
  // Implement this interface method
  global HttpResponse respond(HttpRequest request) {
    // Create a fake response
    HttpResponse response = new HttpResponse();
    response.setHeader('Content-Type', 'application/json');
    response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
    response.setStatusCode(200);
    return response;
  }
}
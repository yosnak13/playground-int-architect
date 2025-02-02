/**
 * Created by yosnak13 on 2025/02/02.
 */

@IsTest
global class AnimalLocatorMock implements HttpCalloutMock {
  global HttpResponse respond(HttpRequest request) {
    HttpResponse response = new HttpResponse();
    response.setHeader('Content-Type', 'application/json');
    response.setBody('{"name": "Mike"}');
    response.setStatusCode(200);
    return response;
  }
}
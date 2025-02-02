/**
 * Created by yosnak13 on 2025/02/02.
 */

public class AnimalLocator {
  public static String getAnimalNameById(Integer animalId) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + String.valueOf(animalId));
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    String animalName = (String) results.get('name');
    return animalName;
  }
}
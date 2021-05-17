import 'package:dio/dio.dart';
import 'package:web_scraper/web_scraper.dart';

WebScraper webS = WebScraper('https://www.mohfw.gov.in');
var vacState;
var newVac;
Future<Map> getDataCovid() async
{     var dio = Dio();
var response = await dio.get('https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');
var data=response.data;
return(data);
}
Future<String> getVacData()
async {
  if (await webS.loadWebPage('/')) {
    vacState = webS.getElement('span.coviddata',[]);
    newVac = webS.getElement('span.coviddataval',[]);
    newVac=newVac[0]['title'].toString();
    vacState=vacState[0]['title'].toString();
    vacState=vacState+ newVac;
  }
  return vacState.toString();
}



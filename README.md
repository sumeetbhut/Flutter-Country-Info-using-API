# country_info

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


Data Source
The data will come from an open RESTful API that serves country information. The API documentation can be found here. For the most part the main API called would be the region endpoint using africa as the parameter i.e.:

https://restcountries.eu/rest/v2/region/africa
N.B. The data from this API is not 100% accurate, use the data as is.

Additional data source
https://restcountries.eu/ provides country flags in SVG format. This may make it slighly more complicated to deal with in flutter. So you may use a different data source for flags. https://flagpedia.net/download/api can be used for this purpose. E.g. https://flagcdn.com/w640/za.png South African Logo where za is the ISO Alpha 2 Code of South Africa.

Required Tasks
Integrate to the Countries API (https://restcountries.eu/) to list countries in the African Region
Complete the countries page (countries.dart) and integrate it to the API
Create click-through navigation to the country page (hint: consider using the route generator)
Bonus Tasks
Provider client-side search/filter capability to filter the list of countries based on user input. You can put the search/filter input on the app bar of the countries page.
List the bordering countries with their flags in horizontally scrollable component that allows click through to the relevant country. E.g. if you are on the South African country detail, Zimbabwe (or the Zimbabwean flag) should show on the bordering countries component and you should be able to click through to the Zimbabwean country detail page.
Handle errors, write clean code. You can use any pattern your are farmiar with.
Detailed designs

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                    <img src="https://user-images.githubusercontent.com/4372065/103433804-b9ce4e00-4c1d-11eb-92e9-6ca2d3fb32da.png"/>
            </td>            
        </tr>
        
  </table>
  </div>

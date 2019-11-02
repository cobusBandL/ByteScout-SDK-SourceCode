@echo off

:: Path of the cURL executable
set CURL="curl.exe"

:: The authentication key (API Key).
:: Get your own by registering at https://app.pdf.co/documentation/api
set API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

:: PDF file.
set SOURCE_FILE=sample.pdf
:: Comma-separated list of page indices (or ranges) to process. Leave empty for all pages. Example: '0,2-5,7-'.
set PAGES=
:: PDF document password. Leave empty for unprotected documents.
set PASSWORD=
:: OCR language. "eng", "fra", "deu", "spa"  supported currently. Let us know if you need more.
set LANGUAGE=eng
:: Result PDF file name
set RESULT_FILE_NAME=result.pdf


:: Prepare URL for `Make Searchable PDF` API call
set QUERY="https://api.pdf.co/v1/pdf/makesearchable?name=%RESULT_FILE_NAME%&password=%PASSWORD%&pages=%PAGES%&lang=%LANGUAGE%"
echo %QUERY%

:: Perform request and save response to a file
%CURL% -# -X GET -H "x-api-key: %API_KEY%" -F "file=@%SOURCE_FILE%" %QUERY% >response.json

:: Display the response
type response.json

:: Use any convenient way to parse JSON response and get URL of generated file(s)


echo.
pause
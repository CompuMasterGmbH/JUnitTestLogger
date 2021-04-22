rd /q /s test-results
dotnet test NUnit3Test -v n --framework net5.0 --results-directory test-results --logger junit --configuration=Debug
move-item -force "test-results/TestResults.xml" "FinalUnitTestOutputVerifyTests/previous-test-results/testresults.nunit3.xml"
dotnet test xUnitTest -v n --framework net5.0 --results-directory test-results --logger junit --configuration=Debug --no-restore
move-item -force "test-results/TestResults.xml" "FinalUnitTestOutputVerifyTests/previous-test-results/testresults.xunit.xml"
dotnet test FinalUnitTestOutputVerifyTests -v n --framework net5.0 --results-directory test-results --logger junit --configuration=Debug --no-restore
notepad test-results\TestResults.xml
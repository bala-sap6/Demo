// Header Comment for this class
public class accountAddMissingForecastMonths {

    Account currentAccount;

    public accountAddMissingForecastMonths(ApexPages.StandardController stdController) {  // Extend the standard Account controller
        currentAccount = (Account)stdController.getRecord();
        currentAccount = [SELECT ID, Number_of_Forecast_Opportunities__c FROM Account WHERE Id = :currentAccount.Id];
    }
    

    public void init(){        
        if (currentAccount.Number_of_Forecast_Opportunities__c > 0) {  // Check if the Account already has Forecast Opportunities
            opportunityForecastMonthRefresh.addMissingForecastMonths(currentAccount.Id);
        }
    }

}
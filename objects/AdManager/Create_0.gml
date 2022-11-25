/// @description Insert description here
// You can write your code in this editor

/// @description Initialize variables

// Debug variables (used in draw event)
status = "UNKNOWN";
type = "UNKNOWN";
global.adRoll = 1;
global.rewardedLimiter = 1000 * 60; //One minute
global.lastAdTime = -global.rewardedLimiter;
global.numRevives = 0;
global.baseOfferChance = .75;
/*
	The first step to configure AdMob with your application/game is to get the
	unique string ad block ids from the admob development console for you app.
	In this example we are using all the bellow ad types:
	
		- Banners
		- Interstitial
		- RewardedVideo
		- RewardedInterstitial
		
	In your case you just need the ones you are using, these ids also change from
	Android to iOS so we also provide a code sample that acounts for that.
	You can set them inside the extension using the new extension options features
	these will be used and set by default or optionaly you can use the old method of
	initialization if you need to change them at runtime (see end of the page).
	
*/

// ###############################################
//                 UTILITY METHODS
// ###############################################

// This function is here for debug purposes and uses 'AdMob_Consent_GetType' and
// 'AdMob_Consent_GetStatus' to print the current consent Status/Type to the console.
function showDebugInfo()
{
	var consent_type = AdMob_Consent_GetType();
	switch(consent_type)//https://developers.google.com/admob/ump/android/api/reference/com/google/android/ump/ConsentInformation.ConsentType
	{
		// The user gave permission for data to be collected in order to provide personalized ads.
		case AdMob_Consent_Type_PERSONALIZED:
			show_debug_message("GoogleMobilesAds ConsentType: PERSONALIZED")
		break
			
		// The user refused to share data for personalized ads. Ads will be NON PERSONALIZED
		case AdMob_Consent_Type_NON_PERSONALIZED:
			show_debug_message("GoogleMobilesAds ConsentType: NON_PERSONALIZED")
		break			

		// Unable to get the current type of consent provided by the use
		// Note that for EEA users, the type will always be UNKNOWN (known issue) 
		case AdMob_Consent_Type_UNKNOWN:
			show_debug_message("GoogleMobilesAds ConsentType: UNKNOWN")
		break
	}
}

// This function is an helper function used for loading all ads
function loadAllAds() {

	AdMob_RewardedVideo_Load();
	AdMob_Banner_Create(AdMob_Banner_ADAPTIVE, false);
}

// This function updates both consent Status and Type strings
// To avoid calling the logic every frame
function updateConsentStrings() {

	// The function 'AdMob_Consent_GetStatus' allows the developer to know if the
	// GDPR consent request is required or not or if the user already answered to the
	// consent request (OBTAINED).
	switch(AdMob_Consent_GetStatus())
	{
		case AdMob_Consent_Status_UNKNOWN: status = "UNKNOWN"; break;
		case AdMob_Consent_Status_NOT_REQUIRED: status = "NOT_REQUIRED"; break;
		case AdMob_Consent_Status_REQUIRED: status = "REQUIRED"; break;
		case AdMob_Consent_Status_OBTAINED: status = "OBTAINED"; break;
	}

	// The function 'AdMob_Consent_GetType' allows the developer to know what was the
	// type of consent given by the user. Can the ads be personalized (allowed) or not (rejected).
	switch(AdMob_Consent_GetType())
	{
		case AdMob_Consent_Type_UNKNOWN: type = "UNKNOWN"; break;
		case AdMob_Consent_Type_NON_PERSONALIZED: type = "NON_PERSONALIZED"; break;
		case AdMob_Consent_Type_PERSONALIZED: type = "PERSONALIZED"; break;
		case AdMob_Consent_Type_DECLINED: type = "DECLINED"; break;
	}
}


AdMob_SetTestDeviceId();

AdMob_Initialize();






# Plivo Helper Library for Salesforce

Add Voice and SMS Text Message Functionality to Your Salesforce App

With this helper library you'll be able to:

* Make requests to Plivo's [REST API](http://www.plivo.com/docs/api)
* Control phone calls and respond to text messages in real time with [XML](http://www.plivo.com/docs/api/xml)

Installation
============
Getting started with Plivo and Salesforce is very simple. Just follow these steps and you'll be calling and sending text messages from Salesforce in no time!

1. Checkout or download the [plivo-salesforce](https://github.com/plivo/plivo-salesforce) library from GitHub.

    ```bash
    $ git clone git@github.com:plivo/plivo-salesforce.git
    ```


1. Install the [Force.com Migration Tool](http://www.salesforce.com/us/developer/docs/daas/Content/forcemigrationtool_install.htm) plugin for Ant, if you don't already have it.

1. Edit `install/build.properties` to insert your Salesforce username and password.  Since you will be using the API to access Salesforce, remember to [append your Security Token](http://www.salesforce.com/us/developer/docs/api/Content/sforce_api_concepts_security.htm#topic-title_login_token) to your password.

1. Open your command line to the `install` folder, then deploy using Ant:

    ```bash
    $ ant deployPlivo
    ```

This will upload our helper library to your Salesforce Organization and give you access to all of Plivo's functionality with simple, easy to use Apex classes.

Quickstart
==========

Getting started with the Plivo API couldn't be easier. 

### Make an Outbound Phone Call

You can make outbound phone calls to landlines, mobiles, and SIP endpoints (e.g., softphones), in any of our [200+ coverage countries](https://www.plivo.com/international-coverage).

#### Process
1. A call will be initiated from the `'src'` parameter to the `'dst'` parameter as indicated by your app. These parameters will be edited in the implementation section.
2. Plivo will request a valid XML from the `'answer_url'`. In this example, when the call is answered, Plivo will play the message "Congratulations! You've made your first outbound call!" from a simple text-to-speech app. To simplify a few steps, we already hosted the text-to-speech app at https://s3.amazonaws.com/static.plivo.com/answer.xml.
3. Plivo will automatically hang up after the message is played.

#### Prerequisites
- Sign up for a free [Plivo trial account](https://manage.plivo.com/accounts/register/)

#### Implementation
1. Copy the code below into your Apex Class.
2. Replace `'Your Auth_ID'` and `'Your Auth_Token'` with the AUTH ID and AUTH TOKEN found on your [Plivo dashboard](https://manage.plivo.com/dashboard/).
3. Change the `'src'` parameter to match your source phone number, which will show up as your Caller ID.  Be sure that all phone numbers include country code, area code, and phone number without spaces or dashes (e.g., 14153336666).
4. Change the `'dst'` parameter to match your destination phone number, i.e. the number you want to call.

Note: If you are using a Plivo Trial account, you can only make calls to phone numbers that have been verified with Plivo. Phone numbers can be verified through the [Sandbox Numbers](https://manage.plivo.com/sandbox-numbers/) page in your Plivo account.


```apex
String api_key = 'Your Auth_ID';
String api_token = 'Your Auth_Token';
RestAPI api = new RestAPI(api_key, api_token, 'v1');

Map<String, String> params = new Map<String, String> ();
params.put('src','1111111111');
params.put('dst','2222222222');
params.put('answer_url', 'https://s3.amazonaws.com/static.plivo.com/answer.xml');
params.put('answer_method','GET');

Call PlaceCallResponse = api.makeCall(params);
```

#### Sample Response

```
Sample output
(201, {
       u'message': u'call fired',
       u'request_uuid': u'85b1d45d-bc12-47f5-89c7-ae4a2c5d5713',
       u'api_id': u'ad0e27a8-9008-11e4-b932-22000ac50fac'
   }
)
```
Check out [this Getting Started page](https://www.plivo.com/docs/getting-started/making-outbound-calls/) or the full [Call API documentation](https://www.plivo.com/docs/api/call/) for more details.

### Send an SMS

This tutorial will show you how to send an outbound Short Message Service (SMS) (i.e. text message) using Plivo’s REST API. This can be used in any web or mobile application that requires communication with end users via SMS text messages including delivery notifications, system alerts, two-factor authentication and even rideshare alerts.

Plivo’s Message API supports Unicode UTF-8 encoded texts, which means that you can send messages in any language. The Message API also automatically splits long messages at 160 characters and concatenates them into a single SMS on the receiver’s end. Delivery reports are also automatically supported in networks where they are provided by the operator.

#### Prerequisites
- Sign up for a free [Plivo trial account](https://manage.plivo.com/accounts/register/)

#### Implementation
1. Copy the code below into your Apex Class.
2. Replace `'Your Auth_ID'` and `'Your Auth_Token'` with the AUTH ID and AUTH TOKEN found on your [Plivo dashboard](https://manage.plivo.com/dashboard/).
3. Change the `'src'` parameter to match your source phone number, which will show up as your Sender ID.  Be sure that all phone numbers include country code, area code, and phone number without spaces or dashes (e.g., 14153336666).
4. Change the `'dst'` parameter to match your destination phone number, i.e. the number to which you want to send a message.
5. Edit the `'text'` parameter with your SMS text message.

You can send SMS text messages to any country using the Message API and set any `'src'` number except for US and Canadian numbers. In order to send text messages to phones in the US or Canada, you will need to purchase a US or Canadian phone number from Plivo and use it as the `'src'` number. You can buy a Plivo number from the [Buy Numbers](https://manage.plivo.com/number/search/) tab on your Plivo account dashboard.

Note: If you are using a trial account, the destination number needs to be verified with Plivo.  Phone numbers can be verified through the [Sandbox Numbers](https://manage.plivo.com/sandbox-numbers/) page in your Plivo account.
```apex
String api_key = 'Your Auth_ID';
String api_token = 'Your Auth_Token';
RestAPI api = new RestAPI(api_key, api_token, 'v1');

Map<String, String> params = new Map<String, String> ();
params.put('src','1111111111');
params.put('dst','2222222222');
params.put('text','Hello, how are you?');

MessageResponse SendMsgResponse = api.sendMessage(params);
```
#### Sample Response
```
(202,
    {
        u'message': u'message(s) queued',
        u'message_uuid': [u'b795906a-8a79-11e4-9bd8-22000afa12b9'],
        u'api_id': u'b77af520-8a79-11e4-b153-22000abcaa64'
    }
)
```
Check out [this Getting Started page](https://www.plivo.com/docs/getting-started/send-a-single-sms/) or the full [Message API documentation](https://www.plivo.com/docs/api/message/) for more details.

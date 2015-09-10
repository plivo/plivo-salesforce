# Plivo Helper Library for Salesforce

Get ready to unleash the power of the Plivo cloud communications platform in Salesforce and Force.com!  Soon you'll be building powerful voice and text messaging apps in Apex and Visualforce.

With this toolkit you'll be able to:

* Make requests to Plivo's [REST API](http://www.plivo.com/docs/api)
* Control phone calls and respond to text messages in real time with [XML](http://www.plivo.com/docs/api/xml)
* Embed [Plivo Client](http://www.plivo.com/docs/sdk/web/) in-browser calling in your Salesforce and Force.com apps


Installation
============

We've made it easy to get started. Just grab the code from GitHub and deploy it to your Salesforce org with the included Ant script.

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

Now all the library code is in your org and you're ready to start coding!



Quickstart
==========

Getting started with the Plivo API couldn't be easier. Create a Plivo REST client to get started. For example, the following code makes a call using the Plivo REST API.

Make a Call
-----------
This sample calls the `to` phone number and plays music.  The `from` number must be a [verified number](https://www.plivo.com/user/account/phone-numbers/verified) on your Plivo account.

```javascript
// Find your Plivo API credentials at https://www.plivo.com/user/account
String account = 'ACXXXXXXXXXXXXXXXXX';
String token = 'YYYYYYYYYYYYYYYYYY';

PlivoRestClient client = new PlivoRestClient(account, token);

Map<String,String> params = new Map<String,String> {
        'To'   => '9991231234',
        'From' => '9991231234',
        'Url'  => 'http://twimlets.com/holdmusic?Bucket=com.plivo.music.ambient'
    };
PlivoCall call = client.getAccount().getCalls().create(params);
```

Send an SMS
-----------
This sample texts *Hello there!* to the `to` phone number.  The `from` number must be a number which you have purchased from Plivo. Unlike voice calls, SMS messages cannot be sent from a verified number.

```javascript
String account = 'ACXXXXXXXXXXXXXXXXX';
String token = 'YYYYYYYYYYYYYYYYYY';
PlivoRestClient client = new PlivoRestClient(account, token);

Map<String,String> params = new Map<String,String> {
        'To'   => '+12316851234',
        'From' => '+15555555555',
        'Body' => 'Hello there!'
    };
PlivoSMS sms = client.getAccount().getSMSMessages().create(params);
```

Generate TwiML
--------------

To control phone calls, your application needs to output [TwiML](http://www.plivo.com/docs/api/xml/). Use `PlivoTwiML.Response` to easily create a TwiML document.

```javascript
PlivoTwiML.Response r = new PlivoTwiML.Response();
PlivoTwiML.Play p = new PlivoTwimL.Play('https://api.plivo.com/cowbell.mp3');
p.setLoop(5);
r.append(p);
System.debug(r.toXML());
```

```xml
<Response><Play loop="5">https://api.plivo.com/cowbell.mp3</Play><Response>
```



Next Steps
==========

The full power of the Plivo API is at your fingertips. Visit the [full documentation](http://readthedocs.org/docs/plivo-salesforce) for advanced topics.

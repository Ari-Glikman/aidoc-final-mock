This is a mock example of a production that takes in HL7 messages via a TCP port, processesses them to decide whether they are identical to previous messages or not, and if the latter (assuming it is a valid message) POSTS a JSON message to a REST API Endpoint as well as updates internal tables to maintain patient records.

A simplified image is here:
![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/c7c21ba8-da7f-448a-ab3f-a6fb322975a5)

The production looks as follows:
![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/afd7ac64-6d2b-4d60-88bc-6e93b275cb49)
![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/11c136d0-640f-4143-8cb3-985b1f4f028d)

We can take a peak inside the process via a message trace:
1) The message is received at the TCP Port and fowarded to the router
2) The router processes it via the rules it has (in this case identifies a ORU_R01:2.3 HL7 message and converts it to JSON)
3) The relevant information is forwarded to the Check Message process where it sends out a request to see if the current information already exists
4 & 5) The request in step 3 is received, the table is checked and we send back confirmation that this is a new message
6) We attempt to POST this information to the REST API Endpoint
7) We are informed that the POST received a successfull response
8) The internal table is updated accordingly 
![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/a10c936b-5fb2-442f-8681-2677ece7f68e)

The 'brains' of the operation is the buisness processes. The best part of it all is that it's simple to make! You don't need to spend hours on stackoverflow understanding functions you will never use again like in other systems.
All you do is 'draw' what you want, compile, and we will make that class for you without you needing to intervene.

![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/bbf04f15-e73c-42f1-9f89-617873a3ac9e)

Of course, there is lots more scenarios and possibilities, but we just wanted to create a simple example demonstrating some of the possibilities. 

What's that? You want to see another scenario? Okay, let's say your organization receives repeated messages and why would you want to be sending out the same information multiple times?

In that case the BP will identify that the message already exists and not POST it, nor create duplicates in the table:

![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/f2e453d9-b848-49da-9eac-1a34f225af9b)

Finally this is our table of our two patients: Morty, Smith, and Rick, Sanchez (no correlation to Smith, Morty or Sanchez, Rick). After multiple updated patient records only the most updated ones are stored in the table (though of course this can be changed as one would want).
![image](https://github.com/Ari-Glikman/aidoc-final-mock/assets/73805987/9043a15d-a4b7-41f3-8ccf-7ea390bea641)

Questions?
Reach out and we (Keren or Ari) will be happy to help

For info about creating the REST Dispatch and Implementation classes check out our colleague, Guillaume Rongier's great repo [here](https://github.com/grongierisc/objectscript-openapi-definition)

Finally, check out Lorenzo Scalese's [repo](https://github.com/lscalese/OpenAPI-Client-Gen/) for creating an IRIS Interoperability Production generator from an OpenAPI Specification. 

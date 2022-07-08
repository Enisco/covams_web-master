# CoVaMS - COVID-19 Vaccination Management System

A database system designed to ease and digitalize the processes of confirmation, tracking, monitoring, and updating of COVID-19 Vaccination Status.

This app has four (4) levels of accessibility.
1. The Admin: A registered Admin is the only one authorized to register and confirm vaccination and verification centres. He has access to the entire data and can easily perform administrative tasks, wigh little or no technical knowledge. The Admins here are the personnels from the ministry of Health, the NCDC, and other major parastatals in the health sector.
2. Vaccination Centres: Vaccination Centres are hospitals and designated vaccination facilities registered and accredited by the Ministry of Health to vacccinte citizens and record their data. These vaccination centres registers the data of anyone their vaccinate and it's added to the database on submission. They are also permitted to create a unique, user's Vaccination ID each vaccinated individual.
3. Verification Centres: These are airports, embassies and every other facility where confirmation of a person's Vaccination status is essential. They have account with the system, and they can verify just by inputting the person's Vaccination ID, and the system returns the user's details if he's vaccinated or returns aan error message if he's not.
4. User: A user can go online to check his own data with his ID, and can receive notifications to come for subsequent jabs, if he's yet to have the second or booster jabs. The latter is going to be incorporated using Twilio (work in progress).

This system uses Flutter Firestore for storage and the state Management tool used throughout is BLoC. It's a web app and the mobile version will soon be released with the next upgrade.


﻿# karaSofka

To install karate and Serenity, follow the steps below:
1. Install IntelliJ IDEA 2023.1.4 (Community Edition), or failing that VSC, https://www.jetbrains.com/es-es/idea/download/?section=windows.
2. Install Jdk jdk-11.0.2_windows-x64_bin
3. Install Gradle 7.6.1 https://gradle.org/releases/
4. Install Maven https://maven.apache.org/download.cgi.
5. Install Git https://git-scm.com/ (these help us to control versions).
6. Install node https://nodejs.org/es
7. Configure global variables, you must add them in Edit Environment Variables
8. Install Cucumber Plugins for Java.
9. Create Project type Gradle
10. For the purpose of this Challenge, I attach the task https://github.com/JRafacand/karaSofka
11. You can follow me at https://github.com/JRafacand
## Executing the tests
1. Click on the green arrow to run the tests (img1)
   ![img1.png](img1.png)
2. To run the tests from the console, you must execute the following command:
   ```bash
   gradle clean test aggregate
   ```
3. To see the results, click on the following path: (img2)
   ```bash
   target/karate-reports/karate-summary.html
   ```
   ![img2.png](img2.png)

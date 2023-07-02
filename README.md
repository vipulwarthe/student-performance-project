# student-performance
##deploy end to end student performance ML model with AWS elastic beanstock and codepipeline##

Krish naik Repo link: https://github.com/krishnaik06/mlproject/
ARCHNA Repo link- https://github.com/swapnil123kapile/MLProjects-archana
vipul repo link:  https://github.com/vipulwarthe/student-performance

First we Create instance with ubuntu AMI with t2.medium instance type with 30GB storage 


   1   sudo apt-get update && sudo apt-get upgrade -y      
   2   sudo apt install python3-venv -y          (install python environment)
   3   python3 -m venv MLPRO
   4   source MLPRO/bin/activate                 (activate env)
   5   mkdir mlproject                           (create one project directory)
   6   cd mlproject                              (enter in project directory)

Login to your github account and create a new repo and paste cmds from github repo:

   7   echo "# End-to-end-ML-Project" >> README.md
   8   git add README.md
   9   git commit -m "First Commit"
   10  git status
   11  git branch -M main
   12  git branch
   13  git remote add origin https://github.com/vipulwarthe/mlproject.git
   14  git push -u origin main
       git remote -v    (additional command)

Create .gitignore file with python template in mlproject repo on github

   15  git pull    # It will pull the .gitignore file in VScode mlproject repo

create setup.py and requirements.txt in mlproject repo add a code in setup.py & requirements.txt

-setup.py will be responsible in creating my ML application as a package

   16  pip install -r requirements.txt 
   17  git status
   18  git add .
   19  git status
   20  git commit -m "Setup"
   21  git push -u origin main


Create src (source) folder in mlproject and create below files in src on vs code  (this is the source file which help to manage the ml model)
__init__.py               -in src
logger.py
exception.py
utils.py
components (folder) in src folder - Create below files in component folder  
  __init__.py
  data_ingestion.py
  data_transformation.py
  model_trainer.py

pipeline (folder) create in src   (we train and predict the model)
  __init__.py
  train_pipeline.py
  predict_pipline.py


paste the code of exception.py
paste the code of logger.py
paste the code of utils.py

-  22  python3 src/logger.py   (we run logger file and it will generate the logs)

   23  git status
   24  git add .
   25  git status
   26  git commit -m "Logging and Exception"
   27  git push -u origin main

now check in git repo you will see all the files which you have commited and push

Create notebook folder in mlproject & add drag below two files in it
1 .EDA STUDENT PERFORMANCE.ipynb
2 .MODEL TRAINING.ipynb

Add another folder named data in notebook folder and below file int

create stud.csv file in data folder and paste data into it. 

       -pip3 install jupyterlab
       -jupyter lab

-if above 2 commands not works then open new terminal and use below commands:

-source /home/ubuntu/MLPRO/bin/activate
-cd mlproject
-pip3 install jupyterlab
-sudo apt install jupyter-notebook
-jupyter notebook --generate-config
-jupyter notebook password   (create new password)
-jupyter-lab --ip 0.0.0.0 --no-browser --allow-root  


Add new 2 terminal if jupyther notebook is open on vscode.
    1  source MLPRO/bin/activate
    2  cd mlproject/ 
    3  git status
    4  git add .
    5  git status
    6  git commit -m "EDA and Problem Statement"
    7  git status
    8  git push -u origin main
    9  python src/components/data_ingestion.py
   10  git status
   11  git add .
   12  git commit -m "Data Ingestion"
   13  git push -u origin main

   15  python src/components/data_transformation.py
  
   16  python src/components/data_ingestion.py
   17  git status
   18  git add .
   19  git status
   20  git commit -m "Data Transformation Done"
   21  git push -u origin main
   22  python src/components/model_trainer.py 
   23  python src/components/data_ingestion.py
   24  git status
   25  git add .
   26  git commit -m "Model Training"
   27  git push -u origin main

  create one templates folder and create 2 files in that (index.html and home.html)and application.py file in mlproject folder
       
       make some changes in code -- add debug=True, port=5000
   30  python application.py
       http://127.0.0.1:5000/predictdata  ----()

   now go to aws beanstalk and create application and give name student_performance and choose platform as python3.7 and create application with other default settings skip to review and submit.
   -now create code-pipeline - create pipeline - name- student-performance- Service role- new service role
   -source- github(v1)


======================================================================
What is Elastic Beanstalk in AWS?
Amazon Elastic Beanstalk is used for deploying and scaling web applications and services that are developed with Java, we can simply upload our code and Elastic Beanstalk automatically handles the deployment. It helps in deploying details of capacity provisioning, load balancing, auto-scaling, and application health monitoring.


Why AWS Elastic Beanstalk?
Elastic Beanstalk is a service for deploying and scaling web applications and services. Upload your code and Elastic Beanstalk automatically handles the deployment—from capacity provisioning, load balancing, and auto scaling to application health monitoring.

What is AWS codepipeline?
AWS CodePipeline is a product of Amazon Web Services. It automates the software deployment process that allows a developer to quickly model, visualize and deliver code for new features and updates. This method is called continuous delivery. It also enables the developer to integrate partner tools and custom tools into any stage of the release process to form an end-to-end continuous delivery solution.

Q: Why should I use AWS CodePipeline to set up a continuous delivery pipeline?
By automating your build, test, and release processes, AWS CodePipeline enables you to increase the speed and quality of your software updates by running all new changes through a consistent set of quality checks.

Q: Which products can be integrated with the continuous delivery pipeline I build with AWS CodePipeline?
AWS CodePipeline integrates with AWS services like AWS CodeCommit, Amazon S3, AWS CodeDeploy, AWS Elastic Beanstalk, AWS OpsWorks, and AWS Lambda. In addition, AWS CodePipeline integrates with a number of partner tools. For details see the product integrations page. Finally, you can write your own custom actions and integrate any existing tool with AWS CodePipeline. 

=================================================================

-first create IAM role for user
-roles- create role - select ec2 - 

1) AWSElasticBeanstalkWebTier 
2) AWSElasticBeanstalkWorkerTier 
3) AWSElasticBeanstalkMulticontainerDocker

-create role

Elastic beanstalk: 
-create application-application name-(student performance)
-platform-python3.8
-application code-sample application -
-Service access-Use an existing service role-aws-elasticbeanstalk-service-role
-key pair - give any - ec2 instace profile - select created profile - skip to review - submit

-till elastic beanstalk envirnoment geting ready we can not create codepipeline(waite for it)

codepipeline:
-create pipeline -pipeline name-student_performance
-service role-new service role-advance setting-default
-next-source provider-github(version1)-connect to the github-
-confirm-select repo-mlproject-Branch-main
-change detection option-Github webhooks-next-
-Add build stage - skip build stage-next-Deploy-Deploy provider-
-AWS elastic beanstalk - Region-select your region-next-
-Application name-student performance-Envirnoment name- studentperformance-env --next- wait for envirnoment create-
-go to the Applications tab and click- select your application name-next-click on create pipeline
-click inside in deploy on AWS elastic beanstalk it will open link in browser
-go to the elastic beanstalk dashboard - you will see the studentperformance-env - click on generated URL it will open in browser
-you will see the home page -just write /predictdata after your URL you will see the prediction page.


-deletation process - first delete codepipeline then delete elastice beanstalk
-then terminate the instance

         demo is over...thank you...to be continue...cloud watch monitoring remaning....

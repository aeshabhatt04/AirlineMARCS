class ApplicationMARCS:
    import Registration
    
    def TicketBook(self):
        from datetime import datetime
        from pickle import TRUE
        import pyodbc as odbc
        import Registration
        
          
        DRIVER = 'SQL Server'
        SERVER_NAME = 'LAPTOP-1AG2EVB7\RSQL'
        DATABASE_NAME = 'AirlinesMARCS'

        conn_string = f"""
                Driver={{{DRIVER}}};
                Server={SERVER_NAME};
                Database={DATABASE_NAME};
                Trust_Connection=yes;
            """

        conn = odbc.connect(conn_string)
        cursor = conn.cursor()

        print("********************************************************************")
        print("*                                                                  *")
        print("*                  Welcome to MARCS Airline App                    *")
        print("*                                                                  *")
        print("********************************************************************")

        while TRUE :
            print("|----------------------------------------------|")
            print("|       Enter 1 for Admin mode                 |")
            print("|       Enter 2 for Passenger mode             |")
            print("|----------------------------------------------|")

            Admin_user_mode = input("Enter your mode : ") 
            if Admin_user_mode == "1" :	
                print("*****************************************\n|         Welcome to admin mode         |\n*****************************************")
                Password = input("Please enter your password : ")
                while True :
                    if Password == "admin" :
                        
                        print("|----------------------------------------------|")
                        print("|    Enter 1 to view all passenger records     |")
                        print("|    Enter 2 to register new passenger         |")
                        print("|    Enter 3 to view all flights               |")
                        print("|    Enter E to return                         |")
                        print("|----------------------------------------------|\n")
                        
                        AdminOptions = input ("Enter your choice : ")
                        AdminOptions = AdminOptions.upper()
                        
                        # View all passenger records
                        if AdminOptions == "1" :
                            print('Below are the name of registered passengers:')
                            cursor.execute("SELECT * FROM dbo.Registration")
                            for row in cursor.fetchall():
                                print(row)

                        # Register new passenger
                        elif AdminOptions == "2":
                            
                            print("\n----------------- Hello Admin------------------\n")
                            print("Please Procced to create passengar account\n")
                            Regobj= Registration.Registration()
                            Regobj.UserRegistration()                               
                            print("----------Passenger added successfully----------")
                        
                        elif AdminOptions == "3":
                            try:
                                print('Below are the available flights')
                                cursor.execute("SELECT * FROM dbo.Flight")
                                for row in cursor.fetchall():
                                    print(row)
                            except:
                                print("---Unable to view flights, try again later!---")

                        elif AdminOptions == "E":
                            print('---System back---\n')
                            break
                        else:
                            print("Please enter a correct option")
                    
            elif Admin_user_mode == "2" :
                print("********************************************************************") 
                print("*                  Welcome to Passenger Mode                       *")
                print("********************************************************************\n")
    
                print("|----------------------------------------|")
                print("|    Enter 1 for New customer  	        |")
                print("|    Enter 2 for Existing customer       |")
                print("|----------------------------------------|\n")    
                passengerchoice=input("Enter choice: ")
                if passengerchoice== "1":
                    print("! Hello New Customer !\n")
                    print("Please Register to book your tickets!\n")
                    Regobj= Registration.Registration()
                    Regobj.UserRegistration()
                    
                if passengerchoice== "2":

                    # Get UserId and Password
                    UserId = input("Enter Username: ")
                    UserPassword = input("Enter Password: ")

                    # Authentication of UserID and password DB
                    cursor.execute(f"SELECT * FROM Registration WHERE UserId = '{UserId}' AND  UserPassword = '{UserPassword}'")

                    checkUsername = cursor.fetchone()
                    if checkUsername == None:
                        print('Username does not exist! Try again')
                        sys.exit()
                    else:
                        print(' HELLO '+ UserId +' YOU ARE LOGGED IN!')   
  
                        # Get date from User
                        DateOfFlight = input("Enter the date of travel(YYYY/MM/DD): ")
                        dof = datetime.strptime(DateOfFlight,"%Y/%m/%d")
                        print("\n")

                        # Display and Get DepartureCity
    
                        print("************** DEPARTURE CITY ******************")
                        print('Below are the domestic city available:')
                        statement = """
                        SELECT DISTINCT DepartureCity FROM dbo.Flight
                        """
                        cursor.execute(statement)
                        for row in cursor.fetchall():
                            print(row)
                        DepartureCity = input("Enter Departure City: ")
                        print("\n")

                         # Display and Get ArrivalCity
                        print("************** ARRIVAL CITY ******************")
                        print('Below are the domestic city available:')

                        cursor.execute("SELECT DISTINCT ArrivalCity FROM dbo.Flight WHERE ArrivalCity!= ?",(DepartureCity))
                        for row in cursor.fetchall():
                            print(row)
                        ArrivalCity = input("Enter Arrival City: ")
                        print("\n")

                        # Get Budget
                        print("************** TICKET BUDGET ******************")
                        Budget = input("Enter your Budget: ")
                        print("\n")

                        # Get Pet choice
                        print("************** PET FRIENDLY ******************")
                        flag = input("Should your flight be pet friendly? Y/N :   ")
                        if flag == 'Y' or flag == 'y' :
                             Petflag = 1
                             NoOfPets= input("Enter No. of Pets: ")
                             Weight=input("Enter approx weight of Pets: ")

                        elif flag == 'N' or flag == 'n' :
                            Petflag = 0
                            NoOfPets = 0
                            Weight = 0.0
             
                        else:
                            print("Invalid choice! Retry Again")
                        print("\n")


                        # Get Meal choice
                        print("************** MEAL OPTION ******************")
                        flag = input("Do you want meal providing flight? Y/N :   ")
                        if flag == 'Y' or flag == 'y' :
                
                            print("\n---------------------------------------------------")
                            print("|Enter 1 - To view Meal options                     |")
                            print("|Enter 2 - To view Airlines associated with meal    |")
                            print("|Enter 3 - To view Airlines not associated with meal|")
                            print("|Enter 0 - To return back                           |")
                            print("---------------------------------------------------\n")
                
                            while TRUE:
                                userinput = input("Option : ")
                    
                                # View Meal options
                                if userinput == "1":
                                    print("\nBelow are the Meal options available:\n")
                                    statement = """
                                    SELECT MealCategory FROM dbo.Meal
                                    """
                                    cursor.execute(statement)
                                    for row in cursor.fetchall():
                                          print(row)
                                    print("\n----------------------------------------")
                                    print("|Enter 1 - To book  Vegetarian           |")
                                    print("|Enter 2 - To book Non-Vegetarian        |")
                                    print("|Enter 3 - To Vegan                      |")
                                    print("|Enter 4 - Meal Not Required return back |")
                                    print("|Enter 0 - Return back                   |")
                                    print("----------------------------------------\n")
                        
                                    Mealoption=input("Choose option: ")
                                    if Mealoption=="1":
                                        print("You booked Vegetarian\n")
                                    elif Mealoption=="2":
                                        print("You booked Non- Vegetarian\n")
                                    elif Mealoption=="3":
                                        print("You booked Vegan\n")
                                    elif Mealoption=="4":
                                        print("You did not book any meal\n")
                                    else:
                                        print("Invalid Option! Try again\n")
                                    break
                    
                                # Airlines associated with meal
                                elif userinput == "2":
                                    print("\nBelow are the Airlines associated with meal:\n")
                                    statement = """
                                    SELECT AirlineName FROM dbo.Airline WHERE Mealflag=1
                                        """
                                    cursor.execute(statement)
                                    for row in cursor.fetchall():
                                        print(row)
                                    print("\n") 
                    
                                # Airlines associated with meal
                                elif userinput == "3":
                                     print("\nBelow are the Airlines not associated with meal:\n")
                                     statement = """
                                     SELECT AirlineName FROM dbo.Airline WHERE Mealflag=0
                                        """
                                     cursor.execute(statement)
                                     for row in cursor.fetchall():
                                         print(row)
                                     print("\n")
                                elif userinput == "0":
                                     break
                        else:
                            Mealoption = 4
                            print("\n")
            
                        # Class of service selection
                        print("******* CLASS OF SERVICE *********")
                        print("\n-----------------------------------")
                        print("|Enter 1 - Economy class            |")
                        print("|Enter 2 - Business class           |")
                        print("|Enter 3 - First class              |")
                        print("|Enter 0 - To return back           |")
                        print("-----------------------------------\n")

                        classofservice = input()
                        if classofservice == "1": 
                            classofservice="Economy"
                            print(classofservice)
                        elif classofservice == "2": 
                            classofservice="Business"
                            print(classofservice)
                        elif classofservice == "3": 
                            classofservice="First"
                            print(classofservice)  
    
                    cursor.execute(f"INSERT INTO PassengerRecord VALUES('{UserId}','{dof}','{DepartureCity}','{ArrivalCity}','{Budget}','{Petflag}','{NoOfPets}','{Weight}','{Mealoption}','AC8098')")
                    conn.commit()
        

appobj=ApplicationMARCS()
   
appobj.TicketBook()


    


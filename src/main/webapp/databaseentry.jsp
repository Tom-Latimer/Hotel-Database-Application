<html>
    <head>
        <title>DatabaseEntry</title>
        <link rel = "stylesheet" href = "./databaseentry.css">
        <link href = "https://fonts.cdnfonts.com/css/glacial-indifference-2" rel = "stylesheet">
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>

        <div class = "topnav" id = "myTopnav">
            <img src = "avainreal.png" alt = "logoimage" class = "centerlogo">
            <a href = "#"><i class="fa fa-fw fa-info"></i>about</a>
            <a href = "#"><i class="fa fa-fw fa-envelope"></i>contact</a>
            <a href = "#"><i class="fa fa-fw fa-home"></i>home</a>
            <a href = "javascript:void(0);" class = "icon" onclick = "TopNav()">
                <i class="fa fa-fw fa-bars"></i>
            </a>
        </div>

        <div class = "main" id = "contentmain">

            <div id = "ReturnButton1" hidden = "true">
                <button class = "button backbutton" onclick = "ReturnTableDropAdd()"><i class="fa fa-fw fa-arrow-left"></i>Return to Tables</button>
            </div>

            <div id = "ReturnButton2" hidden = "true">
                <button class = "button backbutton" onclick = "ReturnTableDropRemove()"><i class="fa fa-fw fa-arrow-left"></i>Return to Tables</button>
            </div>

            <div id = "ReturnButton3" hidden = "true">
                <button class = "button backbutton" onclick = "ReturnTableDropEdit()"><i class="fa fa-fw fa-arrow-left"></i>Return to Tables</button>
            </div>

            <div class = "centerelements" id = "ChoiceButtons">
                <button class = "button choicebutton" onclick = "DisplayTableDropAdd()">Add to a Table</button>
                <button class = "button choicebutton" onclick = "DisplayTableDropRemove()">Remove from a Table</button>
                <button class = "button choicebutton" onclick = "DisplayTableDropEdit()">Edit a Table</button>
            </div>

            <div class = "centerelements" id = "content">

                <div id = "AddTable">
                    <form name = "TableDropAdd" id = "TableDropAdd" hidden = "true">
                        <label for = "AddTableSelect">Choose a table to add to:</label>
                        <select id = "AddTableSelect" name = "AddTableSelect" onchange = "AddDisplayTable()" style = "margin-top: 5%;">
                            <option value = "Add-defaultselect">Choose a table</option>
                            <option value = "Add-Hotel_Chain">Hotel Chain</option>
                            <option value = "Add-Hotel">Hotel</option>
                            <option value = "Add-Room">Room</option>
                            <option value = "Add-Amenity">Amenity</option>
                            <option value = "Add-Problem">Problem</option>
                            <option value = "Add-Employee">Employee</option>
                            <option value = "Add-Customer">Customer</option>
                            <option value = "Add-Renting">Renting</option>
                            <option value = "Add-Booking">Booking</option>
                            <option value = "Add-Works">Works</option>
                            <option value = "Add-Manages">Manages</option>
                            <option value = "Add-Creates">Creates</option>
                            <option value = "Add-Pays">Pays</option>
                            <option value = "Add-Rents">Rents</option>
                            <option value = "Add-Books">Books</option>
                            <option value = "Add-Reserves">Reserves</option>
                            <option value = "Add-Registers">Registers</option>
                        </select>
                    </form>

                    <div id = "Add-Hotel_Chain" hidden = "true">
                        <form action="addHC" method="POST">
                            <label for = "Add-Hotel_Chain-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Hotel_Chain-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Hotel_Chain-street_number">Street Number:</label>
                            <input type = "number" id = "Add-Hotel_Chain-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Add-Hotel_Chain-street_name">Street Name:</label>
                            <input type = "text" id = "Add-Hotel_Chain-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Add-Hotel_Chain-city">City:</label>
                            <input type = "text" id = "Add-Hotel_Chain-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Add-Hotel_Chain-province">Province:</label>
                            <select id = "Add-Hotel_Chain-province" name = "province">
                                <option value = "defaultprovince">Choose a province</option>
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Add-Hotel_Chain-postal">Postal Code:</label>
                            <input type = "text" id = "Add-Hotel_Chain-postal" name = "postal" placeholder = "Postal Code" minlength = "1" maxlength = "6" required><br>

                            <label for = "Add-Hotel_Chain-Phone_numbers">Phone Number:</label>
                            <input type = "text" id = "Add-Hotel_Chain-Phone_numbers" name = "Phone_numbers" placeholder = "Phone Number" minlength = "1" required><br>

                            <label for = "Add-Hotel_Chain-email_addresses">Email Address:</label>
                            <input type = "text" id = "Add-Hotel_Chain-email_addresses" name = "email_addresses" placeholder = "Email Address" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Hotel" hidden = "true">

                        <form action="addH" method="POST">
                            <label for = "Add-Hotel-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Hotel-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Hotel-name">Hotel name:</label>
                            <input type = "text" id = "Add-Hotel-name" name = "name" placeholder = "Hotel Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Hotel-rating">Rating:</label>
                            <input type = "number" id = "Add-Hotel-rating" name = "rating" placeholder = "Rating" min = "1" max = "5" step = ".1" required><br>

                            <label for = "Add-Hotel-street_number">Street Number:</label>
                            <input type = "number" id = "Add-Hotel-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Add-Hotel-street_name">Street Name:</label>
                            <input type = "text" id = "Add-Hotel-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Add-Hotel-city">City:</label>
                            <input type = "text" id = "Add-Hotel-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Add-Hotel-province">Province:</label>
                            <select id = "Add-Hotel-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Add-Hotel-postal">Postal Code:</label>
                            <input type = "text" id = "Add-Hotel-postal" name = "postal" placeholder = "Postal Code" minlength = "1" maxlength = "6" required><br>

                            <label for = "Add-Hotel-Phone_numbers">Phone Number:</label>
                            <input type = "text" id = "Add-Hotel-Phone_numbers" name = "Phone_numbers" placeholder = "Phone Number" minlength = "1" required><br>

                            <label for = "Add-Hotel-email_addresses">Email Address:</label>
                            <input type = "text" id = "Add-Hotel-email_addresses" name = "email_addresses" placeholder = "Email Address" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Room" hidden = "true">
                        <form>
                            <label for = "Add-Room-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Room-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Room-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Room-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Room-price">Price:</label>
                            <input type = "number" id = "Add-Room-hotel_id" name = "hotel_id" placeholder = "Price" min = "0" max = "99999" step = "0.01" required><br>

                            <label for = "Add-Room-capacity">Capacity:</label>
                            <input type = "number" id = "Add-Room-hotel_id" name = "hotel_id" placeholder = "Capacity" min = "1" required><br>

                            <label for = "Add-Room-view_type">View type:</label>
                            <select id = "Add-Room-view_type" name = "view_type">
                                <option value = "true">Sea View</option>
                                <option value = "false">Mountain View</option>
                            </select>

                            <label for = "Add-Room-availability">Room Availability:</label>
                            <select id = "Add-Room-availability" name = "availability">
                                <option value = "true">Available</option>
                                <option value = "false">Not Available</option>
                            </select>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Amenity" hidden = "true">
                        <form>
                            <label for = "Add-Amenity-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Amenity-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Amenity-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Amenity-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Amenity-room_id">Room ID:</label>
                            <input type = "number" id = "Add-Amenity-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <label for = "Add-Amenity-amen_type">Amenity:</label>
                            <input type = "text" id = "Add-Amenity-amen_type" name = "amen_type" placeholder = "Amenity" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Problem" hidden = "true">
                        <form>
                            <label for = "Add-Problem-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Problem-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Problem-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Problem-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Problem-room_id">Room ID:</label>
                            <input type = "number" id = "Add-Problem-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <label for = "Add-Problem-prob_type">Problem:</label>
                            <input type = "text" id = "Add-Problem-prob_type" name = "amen_type" placeholder = "Problem" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Employee" hidden = "true">
                        <form action="addE" method="POST">
                            <label for = "Add-Employee-ssn">SSN:</label>
                            <input type = "number" id = "Add-Employee-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Employee-first_name">First name:</label>
                            <input type = "text" id = "Add-Employee-first_name" name = "first_name" placeholder = "First name" minlength = "1" required><br>

                            <label for = "Add-Employee-last_name">Last name:</label>
                            <input type = "text" id = "Add-Employee-last_name" name = "last_name" placeholder = "Last name" minlength = "1" required><br>

                            <label for = "Add-Employee-street_number">Street Number:</label>
                            <input type = "number" id = "Add-Employee-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Add-Employee-street_name">Street Name:</label>
                            <input type = "text" id = "Add-Employee-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Add-Employee-city">City:</label>
                            <input type = "text" id = "Add-Employee-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Add-Employee-province">Province:</label>
                            <select id = "Add-Employee-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Add-Employee-role">Employee role:</label>
                            <input type = "text" id = "Add-Employee-role" name = "role" placeholder = "Employee role" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Customer" hidden = "true">
                        <form action="addC" method="POST">
                            <label for = "Add-Customer-ssn">SSN:</label>
                            <input type = "number" id = "Add-Customer-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Customer-first_name">First name:</label>
                            <input type = "text" id = "Add-Customer-first_name" name = "first_name" placeholder = "First name" minlength = "1" required><br>

                            <label for = "Add-Customer-last_name">Last name:</label>
                            <input type = "text" id = "Add-Customer-last_name" name = "last_name" placeholder = "Last name" minlength = "1" required><br>

                            <label for = "Add-Customer-street_number">Street Number:</label>
                            <input type = "number" id = "Add-Customer-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Add-Customer-street_name">Street Name:</label>
                            <input type = "text" id = "Add-Customer-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Add-Customer-city">City:</label>
                            <input type = "text" id = "Add-Customer-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Add-Customer-province">Province:</label>
                            <select id = "Add-Customer-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Add-Customer-date_of_registration">Date of Registration:</label>
                            <input type = "date" id = "Add-Customer-date_of_registration" name = "date_of_registration" placeholder = "Date of Registration" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Renting" hidden = "true">
                        <form>
                            <label for = "Add-Renting-start_date">Date of Registration:</label>
                            <input type = "date" id = "Add-Renting-start_date" name = "start_date" placeholder = "Start Date" minlength = "1" required><br>

                            <label for = "Add-Renting-end_date">Date of Registration:</label>
                            <input type = "date" id = "Add-Renting-end_date" name = "end_date" placeholder = "End Date" minlength = "1" required><br>

                            <label for = "Add-Renting-cost">Cost:</label>
                            <input type = "number" id = "Add-Renting-cost" name = "cost" placeholder = "Cost" min = "0" max = "99999" step = "0.01" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Booking" hidden = "true">
                        <form>
                            <label for = "Add-Booking-start_date">Date of Registration:</label>
                            <input type = "date" id = "Add-Booking-start_date" name = "start_date" placeholder = "Start Date" minlength = "1" required><br>

                            <label for = "Add-Booking-end_date">Date of Registration:</label>
                            <input type = "date" id = "Add-Booking-end_date" name = "end_date" placeholder = "End Date" minlength = "1" required><br>

                            <label for = "Add-Booking-cost">Cost:</label>
                            <input type = "number" id = "Add-Booking-cost" name = "cost" placeholder = "Cost" min = "0" max = "99999" step = "0.01" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Works" hidden = "true">
                        <form>
                            <label for = "Add-Works-ssn">SSN:</label>
                            <input type = "number" id = "Add-Works-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Works-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Works-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Works-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Works-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Manages" hidden = "true">
                        <form>
                            <label for = "Add-Manages-ssn">SSN:</label>
                            <input type = "number" id = "Add-Manages-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Manages-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Manages-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Manages-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Manages-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Creates" hidden = "true">
                        <form>
                            <label for = "Add-Creates-ssn">SSN:</label>
                            <input type = "number" id = "Add-Creates-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Creates-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Creates-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Pays" hidden = "true">
                        <form>
                            <label for = "Add-Pays-ssn">SSN:</label>
                            <input type = "number" id = "Add-Pays-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Pays-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Pays-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Rents" hidden = "true">
                        <form>
                            <label for = "Add-Rents-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Rents-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <label for = "Add-Rents-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Rents-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Rents-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Rents-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Rents-room_id">Room ID:</label>
                            <input type = "number" id = "Add-Rents-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Books" hidden = "true">
                        <form>
                            <label for = "Add-Books-booking_id">Booking ID:</label>
                            <input type = "number" id = "Add-Books-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <label for = "Add-Books-chain_name">Chain name:</label>
                            <input type = "text" id = "Add-Books-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Add-Books-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Add-Books-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Add-Books-room_id">Room ID:</label>
                            <input type = "number" id = "Add-Books-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Reserves" hidden = "true">
                        <form>
                            <label for = "Add-Reserves-ssn">SSN:</label>
                            <input type = "number" id = "Add-Reserves-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Reserves-booking_id">Booking ID:</label>
                            <input type = "number" id = "Add-Reserves-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Add-Registers" hidden = "true">
                        <form>
                            <label for = "Add-Registers-ssn">SSN:</label>
                            <input type = "number" id = "Add-Registers-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Add-Registers-booking_id">Booking ID:</label>
                            <input type = "number" id = "Add-Registers-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                </div>

                <div id = "RemoveTable">
                    <form name = "TableDropRemove" id = "TableDropRemove" hidden = "true">
                        <label for = "RemoveTableSelect">Choose a table to remove from:</label>
                        <select id = "RemoveTableSelect" name = "RemoveTableSelect" onchange = "RemoveDisplayTable()" style = "margin-top: 5%;">
                            <option value = "Remove-defaultselect">Choose a table</option>
                            <option value = "Remove-Hotel_Chain">Hotel Chain</option>
                            <option value = "Remove-Hotel">Hotel</option>
                            <option value = "Remove-Room">Room</option>
                            <option value = "Remove-Amenity">Amenity</option>
                            <option value = "Remove-Problem">Problem</option>
                            <option value = "Remove-Employee">Employee</option>
                            <option value = "Remove-Customer">Customer</option>
                            <option value = "Remove-Renting">Renting</option>
                            <option value = "Remove-Booking">Booking</option>
                            <option value = "Remove-Works">Works</option>
                            <option value = "Remove-Manages">Manages</option>
                            <option value = "Remove-Creates">Creates</option>
                            <option value = "Remove-Pays">Pays</option>
                            <option value = "Remove-Rents">Rents</option>
                            <option value = "Remove-Books">Books</option>
                            <option value = "Remove-Reserves">Reserves</option>
                            <option value = "Remove-Registers">Registers</option>
                        </select>
                    </form>

                    <div id = "Remove-Hotel_Chain" hidden = "true">
                        <form>

                            <label for = "Remove-Hotel_Chain-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Hotel_Chain-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Hotel" hidden = "true">
                        <form>

                            <label for = "Remove-Hotel-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Hotel-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Hotel-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Hotel-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Room" hidden = "true">
                        <form>

                            <label for = "Remove-Room-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Room-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Room-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Room-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Room-room_id">Room ID:</label>
                            <input type = "number" id = "Remove-Room-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Amenity" hidden = "true">
                        <form>

                            <label for = "Remove-Amenity-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Room-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Amenity-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Room-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Amenity-room_id">Room ID:</label>
                            <input type = "number" id = "Remove-Room-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Amenity-amen_type">Amenity Type:</label>
                            <input type = "text" id = "Remove-Room-amen_type" name = "amen_type" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Problem" hidden = "true">
                        <form>

                            <label for = "Remove-Problem-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Problem-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Problem-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Problem-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Problem-room_id">Room ID:</label>
                            <input type = "number" id = "Remove-Problem-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Problem-prob_type">Problem Type:</label>
                            <input type = "text" id = "Remove-Problem-prob_type" name = "prob_type" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Employee" hidden = "true">
                        <form>

                            <label for = "Remove-Employee-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Employee-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Customer" hidden = "true">
                        <form>

                            <label for = "Remove-Customer-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Customer-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Renting" hidden = "true">
                        <form>

                            <label for = "Remove-Renting-rent_id">Renting ID:</label>
                            <input type = "number" id = "Remove-Renting-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Booking" hidden = "true">
                        <form>

                            <label for = "Remove-Booking-booking_id">Booking ID:</label>
                            <input type = "number" id = "Remove-Booking-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Works" hidden = "true">
                        <form>

                            <label for = "Remove-Works-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Works-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Works-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Works-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Works-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Works-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Manages" hidden = "true">
                        <form>

                            <label for = "Remove-Manages-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Manages-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Manages-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Manages-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Manages-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Manages-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Creates" hidden = "true">
                        <form>

                            <label for = "Remove-Creates-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Creates-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Creates-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Creates-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Pays" hidden = "true">
                        <form>

                            <label for = "Remove-Pays-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Pays-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Pays-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Pays-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Rents" hidden = "true">
                        <form>

                            <label for = "Remove-Rents-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Rents-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Rents-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Rents-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Rents-room_id">Room ID:</label>
                            <input type = "number" id = "Remove-Rents-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Rents-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Rents-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Books" hidden = "true">
                        <form>

                            <label for = "Remove-Books-chain_name">Chain name:</label>
                            <input type = "text" id = "Remove-Rents-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Remove-Books-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Rents-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Books-room_id">Room ID:</label>
                            <input type = "number" id = "Remove-Rents-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Books-booking_id">Booking ID:</label>
                            <input type = "number" id = "Remove-Rents-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Remove-Reserves" hidden = "true">
                        <form>

                            <label for = "Remove-Reserves-booking_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Reserves-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Reserves-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Reserves-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                        </form>
                    </div>

                    <div id = "Remove-Registers" hidden = "true">
                        <form>

                            <label for = "Remove-Registers-booking_id">Hotel ID:</label>
                            <input type = "number" id = "Remove-Registers-rent_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Remove-Registers-ssn">SSN:</label>
                            <input type = "number" id = "Remove-Registers-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                        </form>
                    </div>

                </div>

                <div id = "EditTable">
                    <form name = "TableDropEdit" id = "TableDropEdit" hidden = "true">
                        <label for = "EditTableSelect">Choose a table to edit:</label>
                        <select id = "EditTableSelect" name = "EditTableSelect" onchange = "EditDisplayTable()" style = "margin-top: 5%;">
                            <option value = "Edit-defaultselect">Choose a table</option>
                            <option value = "Edit-Hotel_Chain">Hotel Chain</option>
                            <option value = "Edit-Hotel">Hotel</option>
                            <option value = "Edit-Room">Room</option>
                            <option value = "Edit-Amenity">Amenity</option>
                            <option value = "Edit-Problem">Problem</option>
                            <option value = "Edit-Employee">Employee</option>
                            <option value = "Edit-Customer">Customer</option>
                            <option value = "Edit-Renting">Renting</option>
                            <option value = "Edit-Booking">Booking</option>
                            <option value = "Edit-Works">Works</option>
                            <option value = "Edit-Manages">Manages</option>
                            <option value = "Edit-Creates">Creates</option>
                            <option value = "Edit-Pays">Pays</option>
                            <option value = "Edit-Rents">Rents</option>
                            <option value = "Edit-Books">Books</option>
                            <option value = "Edit-Reserves">Reserves</option>
                            <option value = "Edit-Registers">Registers</option>
                        </select>
                    </form>

                    <div id = "Edit-Hotel_Chain" hidden = "true">
                        <form>

                            <label for = "Edit-Hotel_Chain-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Hotel_Chain-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Hotel" hidden = "true">
                        <form>

                            <label for = "Edit-Hotel-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Hotel-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Hotel-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Hotel-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Room" hidden = "true">
                        <form>

                            <label for = "Edit-Room-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Room-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Room-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Room-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Room-room_id">Room ID:</label>
                            <input type = "number" id = "Edit-Room-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Amenity" hidden = "true">
                        <form>

                            <label for = "Edit-Amenity-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Room-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Amenity-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Room-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Amenity-room_id">Room ID:</label>
                            <input type = "number" id = "Edit-Room-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Amenity-amen_type">Amenity Type:</label>
                            <input type = "text" id = "Edit-Room-amen_type" name = "amen_type" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Problem" hidden = "true">
                        <form>

                            <label for = "Edit-Problem-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Problem-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Problem-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Problem-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Problem-room_id">Room ID:</label>
                            <input type = "number" id = "Edit-Problem-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Problem-prob_type">Problem Type:</label>
                            <input type = "text" id = "Edit-Problem-prob_type" name = "prob_type" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Employee" hidden = "true">
                        <form>

                            <label for = "Edit-Employee-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Employee-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Customer" hidden = "true">
                        <form>

                            <label for = "Edit-Customer-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Customer-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Renting" hidden = "true">
                        <form>

                            <label for = "Edit-Renting-rent_id">Renting ID:</label>
                            <input type = "number" id = "Edit-Renting-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Booking" hidden = "true">
                        <form>

                            <label for = "Edit-Booking-booking_id">Booking ID:</label>
                            <input type = "number" id = "Edit-Booking-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Works" hidden = "true">
                        <form>

                            <label for = "Edit-Works-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Works-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Works-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Works-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Works-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Works-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Manages" hidden = "true">
                        <form>

                            <label for = "Edit-Manages-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Manages-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Manages-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Manages-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Manages-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Manages-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Creates" hidden = "true">
                        <form>

                            <label for = "Edit-Creates-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Creates-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Creates-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Creates-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Pays" hidden = "true">
                        <form>

                            <label for = "Edit-Pays-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Pays-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Pays-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Pays-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Rents" hidden = "true">
                        <form>

                            <label for = "Edit-Rents-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Rents-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Rents-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Rents-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Rents-room_id">Room ID:</label>
                            <input type = "number" id = "Edit-Rents-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Rents-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Rents-rent_id" name = "rent_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Books" hidden = "true">
                        <form>

                            <label for = "Edit-Books-chain_name">Chain name:</label>
                            <input type = "text" id = "Edit-Rents-chain_name" name = "chain_name" placeholder = "Primary Key" minlength = "1" maxlength = "20" required><br>

                            <label for = "Edit-Books-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Rents-hotel_id" name = "hotel_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Books-room_id">Room ID:</label>
                            <input type = "number" id = "Edit-Rents-room_id" name = "room_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Books-booking_id">Booking ID:</label>
                            <input type = "number" id = "Edit-Rents-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Reserves" hidden = "true">
                        <form>

                            <label for = "Edit-Reserves-booking_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Reserves-booking_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Reserves-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Reserves-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>

                    <div id = "Edit-Registers" hidden = "true">
                        <form>

                            <label for = "Edit-Registers-booking_id">Hotel ID:</label>
                            <input type = "number" id = "Edit-Registers-rent_id" name = "booking_id" placeholder = "Primary Key" min = "0" required><br>

                            <label for = "Edit-Registers-ssn">SSN:</label>
                            <input type = "number" id = "Edit-Registers-ssn" name = "ssn" placeholder = "Primary Key" min = "0" max = "999999999"required><br>

                            <input type = "submit" value = "Submit">

                        </form>
                    </div>
                </div>

            </div>

        </div>

    </body>

    <script>
        function TopNav() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            }
            else {
                x.className = "topnav";
            }
        }

        function DisplayTableDropAdd() {
            document.getElementById('ChoiceButtons').hidden = true;
            document.getElementById('TableDropAdd').hidden = false;
        }

        function DisplayTableDropRemove() {
            document.getElementById('ChoiceButtons').hidden = true;
            document.getElementById('TableDropRemove').hidden = false;
        }

        function DisplayTableDropEdit() {
            document.getElementById('ChoiceButtons').hidden = true;
            document.getElementById('TableDropEdit').hidden = false;
        }

        function AddDisplayTable() {
            const SelectedTable = document.querySelector('#AddTableSelect').value;
            document.getElementById('ReturnButton1').hidden = false;
            document.getElementById(SelectedTable).hidden = false;
            document.getElementById('TableDropAdd').hidden = true;
        }

        function RemoveDisplayTable() {
            const SelectedTable = document.querySelector('#RemoveTableSelect').value;
            document.getElementById('ReturnButton2').hidden = false;
            document.getElementById(SelectedTable).hidden = false;
            document.getElementById('TableDropRemove').hidden = true;
        }

        function EditDisplayTable() {
            const SelectedTable = document.querySelector('#EditTableSelect').value;
            document.getElementById('ReturnButton3').hidden = false;
            document.getElementById(SelectedTable).hidden = false;
            document.getElementById('TableDropEdit').hidden = true;
        }

        function ReturnTableDropAdd() {
            const SelectedTable = document.querySelector('#AddTableSelect').value;
            document.getElementById('ReturnButton1').hidden = true;
            document.getElementById(SelectedTable).hidden = true;
            document.getElementById('TableDropAdd').hidden = false;
        }

        function ReturnTableDropRemove() {
            const SelectedTable = document.querySelector('#RemoveTableSelect').value;
            document.getElementById('ReturnButton2').hidden = true;
            document.getElementById(SelectedTable).hidden = true;
            document.getElementById('TableDropRemove').hidden = false;
        }

        function ReturnTableDropEdit() {
            const SelectedTable = document.querySelector('#EditTableSelect').value;
            document.getElementById('ReturnButton3').hidden = true;
            document.getElementById(SelectedTable).hidden = true;
            document.getElementById('TableDropEdit').hidden = false;
        }
    </script>

</html>
exportObj = exports ? this

exportObj.codeToLanguage ?= {}
exportObj.codeToLanguage.de = 'Deutsch'

exportObj.translations ?= {}
# This is here mostly as a template for other languages.
exportObj.translations.Deutsch =
    action:
        "Barrel Roll": "Fassrolle"
        "Boost": "Schub"
        "Evade": "Ausweichen"
        "Focus": "Fokussierung"
        "Target Lock": "Zielerfassung"
        "Recover": "Recover"
        "Reinforce": "Reinforce"
        "Jam": "Jam"
        "Coordinate": "Coordinate"
        "Cloak": "Cloak"
    slot:
        "Astromech": "Astromech"
        "Bomb": "Bombe"
        "Cannon": "Kanone"
        "Crew": "Crew"
        "Elite": "Elite"
        "Missile": "Rakete"
        "System": "System"
        "Torpedo": "Torpedo"
        "Turret": "Geschützturm"
        "Cargo": "Cargo"
        "Hardpoint": "Hardpoint"
        "Team": "Team"
    sources: # needed?
        "Core": "Grundspiel"
        "A-Wing Expansion Pack": "A-Wing Erweiterung"
        "B-Wing Expansion Pack": "B-Wing Erweiterung"
        "X-Wing Expansion Pack": "X-Wing Erweiterung"
        "Y-Wing Expansion Pack": "Y-Wing Erweiterung"
        "Millennium Falcon Expansion Pack": "Millenium Falke Erweiterung"
        "HWK-290 Expansion Pack": "HWK-290 Erweiterung"
        "TIE Fighter Expansion Pack": "TIE-Fighter Erweiterung"
        "TIE Interceptor Expansion Pack": "TIE-Abfangjäger Erweiterung"
        "TIE Bomber Expansion Pack": "TIE-Bomber Erweiterung"
        "TIE Advanced Expansion Pack": "TIE-Advanced Erweiterung"
        "Lambda-Class Shuttle Expansion Pack": "Lambda Class Shuttle Erweiterung"
        "Slave I Expansion Pack": "Slave I Erweiterung"
        "Imperial Aces Expansion Pack": "Fliegerasse des Imperiums Erweiterung"
        "Rebel Transport Expansion Pack": "Rebel Transport Expansion Pack"
        "Z-95 Headhunter Expansion Pack": "Z-95 Headhunter Expansion Pack"
        "TIE Defender Expansion Pack": "TIE Defender Expansion Pack"
        "E-Wing Expansion Pack": "E-Wing Expansion Pack"
        "TIE Phantom Expansion Pack": "TIE Phantom Expansion Pack"
        "Tantive IV Expansion Pack": "Tantive IV Expansion Pack"
        "Rebel Aces Expansion Pack": "Rebel Aces Expansion Pack"
    ui:
        shipSelectorPlaceholder: "Wähle eines Schiffes"
        pilotSelectorPlaceholder: "Wähle einen Piloten"
        upgradePlaceholder: (translator, language, slot) ->
            "kein #{translator language, 'slot', slot} Upgrade"
        modificationPlaceholder: "keine Modifikation"
        titlePlaceholder: "kein Titel"
        upgradeHeader: (translator, language, slot) ->
            "#{translator language, 'slot', slot} Upgrade"
        unreleased: "unveröffentlichte"
        epic: "epic"
    byCSSSelector:
        '.translate.sort-cards-by': 'Sortiere Karten per'
        '.xwing-card-browser option[value="name"]': 'Name'
        '.xwing-card-browser option[value="source"]': 'Quelle'
        '.xwing-card-browser option[value="type-by-points"]': 'Typ (Punkte)'
        '.xwing-card-browser option[value="type-by-name"]': 'Typ (Name)'
        '.xwing-card-browser .translate.select-a-card': 'Wähle eine Karte aus der Liste links.'
    singular:
        'pilots': 'Pilot'
        'modifications': 'Modifikation'
        'titles': 'Titel'
    types:
        'Pilot': 'Pilot'
        'Modification': 'Modifikation'
        'Title': 'Titel'

exportObj.cardLoaders ?= {}
exportObj.cardLoaders.Deutsch = () ->
    exportObj.cardLanguage = 'Deutsch'

    # Assumes cards-common has been loaded
    basic_cards = exportObj.basicCardData()

    exportObj.ships = basic_cards.ships

    # Move TIE Interceptor to TIE Abfangjäger
    exportObj.renameShip 'TIE Interceptor', 'TIE Abfangjäger'

    pilot_translations =
        "Wedge Antilles":
            text: """Wenn du angreifst, sinkt der Wendigkeitswert des Verteidigers um 1 (Minimum 0)."""
        "Garven Dreis":
            text: """Wenn du einen Fokusmarker ausgibst, darfst du ihn auf ein anderes freundliches Schiff in Reichweite 1-2 legen (anstatt ihn abzulegen)."""
        "Red Squadron Pilot":
            name: "Pilot der Rot-Staffel"
        "Rookie Pilot":
            name: "Anfängerpilot"
        "Biggs Darklighter":
            text: """Andere freundliche Schiffe in Reichweite 1 dürfen nur dann angegriffen werden, wenn der Angreifer dich nicht zum Ziel bestimmen kann."""
        "Luke Skywalker":
            text: """Wenn du verteidigst, kannst du 1 deiner %FOCUS% in ein %EVADE% ändern."""
        "Gray Squadron Pilot":
            name: "Pilot der Grau-Staffel"
        '"Dutch" Vander':
            text: """Wähle ein anderes freundliches Schiff in Reichweite 1-2, nachdem du eine Zielerfassung durchgeführt hast. Das gewählte Schiff darf sofort ebenfalls eine Zielerfassung durchführen."""
        "Horton Salm":
            text: """Wenn du ein Ziel in Reichweite 2-3 angreifst, darfst du beliebig viele Leerseiten neu würfeln."""
        "Gold Squadron Pilot":
            name: "Pilot der Gold-Staffel"
        "Academy Pilot":
            name: "Pilot der Akademie"
        "Obsidian Squadron Pilot":
            name: "Pilot der Obsidian-Staffel"
        "Black Squadron Pilot":
            name: "Pilot der Schwarz-Staffel"
        '"Winged Gundark"':
            name: '"Geflügelter Gundark"'
            text: """Wenn du ein Ziel in Reichweite 1 angreifst, darfst du eines deiner %HIT% in ein %CRIT% ändern."""
        '"Night Beast"':
            name: '"Nachtbestie"'
            text: """Nachdem du ein grünes Manöver ausgeführt hast, darfst du als freie Aktion eine Fokussierung durchführen."""
        '"Backstabber"':
            text: """Wenn du bei deinem Angriff nicht im Feuerwinkel des Verteidigers bist, erhältst du 1 zusätzlichen Angriffswürfel."""
        '"Dark Curse"':
            text: """Wenn du verteidigst, können angreifende Schiffe keine Fokusmarker ausgeben oder Angriffswürfel neu würfeln."""
        '"Mauler Mithel"':
            text: """Wirf 1 zusätzlichen Angriffswürfel, wenn du ein Ziel in Reichweite 1 angreifst."""
        '"Howlrunner"':
            name: '"Kreischläufer"'
            text: """Wenn ein anderes freundliches Schiff in Reichweite 1 mit seinen Primärwaffen angreift, darf es 1 Angriffswürfel neu würfeln."""
        "Maarek Stele":
            text: """Wenn ein Verteidiger durch deinen Angriff eine offene Schadenskarte erhalten würde, ziehst du stattdessen 3 Schadenskarten, wählst eine davon zum Austeilen und legst die restlichen ab."""
        "Tempest Squadron Pilot":
            name: "Pilot der Tornado-Staffel"
        "Storm Squadron Pilot":
            name: "Pilot der Storm-Staffel"
        "Darth Vader":
            text: """Im Schritt "Aktionen durchführen" darfst du 2 Aktionen durchführen."""
        "Alpha Squadron Pilot":
            name: "Pilot der Alpha-Staffel"
            ship: "TIE Abfangjäger"
        "Avenger Squadron Pilot":
            name: "Pilot der Avenger-Staffel"
            ship: "TIE Abfangjäger"
        "Saber Squadron Pilot":
            name: "Pilot der Saber-Staffel"
            ship: "TIE Abfangjäger"
        "\"Fel's Wrath\"":
            ship: "TIE Abfangjäger"
            text: """Wenn die Summe deiner Schadenskarten deinen Hüllenwert erreicht oder übersteigt, wirst du nicht sofort zerstört, sondern erst am Ende der Kampfphase."""
        "Turr Phennir":
            ship: "TIE Abfangjäger"
            text: """Nachdem du angegriffen hast, darfst du eine freie Aktion Schub oder Fassrolle durchführen."""
        "Soontir Fel":
            ship: "TIE Abfangjäger"
            text: """Immer wenn du einen Stressmarker erhältst, darfst du deinem Schiff auch einen Fokusmarker geben."""
        "Tycho Celchu":
            text: """Du darfst auch dann Aktionen durchführen, wenn du Stressmarker hast."""
        "Arvel Crynyd":
            text: """Wenn du angreifst, darfst du auch auf feindliche Schiffe zielen, deren Basen du berührst (vorausgesetzt sie sind innerhalb deines Feuerwinkels)."""
        "Green Squadron Pilot":
            name: "Pilot der Grün-Staffel"
        "Prototype Pilot":
            name: "Testpilot"
        "Outer Rim Smuggler":
            name: "Schmuggler aus dem Outer Rim"
        "Chewbacca":
            text: """Wenn du eine offene Schadenskarte erhältst, wird sie sofort umgedreht (ohne dass ihr Kartentext in Kraft tritt)."""
        "Lando Calrissian":
            text: """Wähle nach dem Ausführen eines grünen Manövers ein anderes freundliches Schiff in Reichweite 1. Dieses Schiff darf eine freie Aktion aus seiner Aktionsleiste durchführen."""
        "Han Solo":
            text: """Wenn du angreifst, darfst du all deine Würfel neu würfeln. Tust du dies, musst du so viele Würfel wie möglich neu würfeln."""
        "Kath Scarlet":
            text: """Wenn du angreifst und der Verteidiger mindestens 1 %CRIT% negiert, erhält er 1 Stressmarker."""
        "Boba Fett":
            text: """Immer wenn du ein Eindrehmanöver (%BANKLEFT% oder %BANKRIGHT%) aufdeckst, kannst du das Eindrehmanöver mit gleicher Geschwindigkeit aber anderer Richtung auf deinem Rad nachträglich einstellen."""
        "Krassis Trelix":
            text: """Wenn du mit einer Sekundärwaffe angreifst, darfst du 1 Angriffswürfel neu würfeln."""
        "Bounty Hunter":
            name: "Kopfgeldjäger"
        "Ten Numb":
            text: """Wenn du angreifst, kann 1 deiner %CRIT% von Verteidigungswürfeln nicht negiert werden."""
        "Ibtisam":
            text: """Beim Angreifen oder Verteidigen darfst du 1 deiner Würfel neu würfeln, sofern du mindestens 1 Stressmarker hast."""
        "Dagger Squadron Pilot":
            name: "Pilot der Dagger-Staffel"
        "Blue Squadron Pilot":
            name: "Pilot der Blauen Staffel"
        "Rebel Operative":
            name: "Rebellenagent"
        "Roark Garnet":
            text: '''Wähle zu Beginn der Kampfphase 1 anderes freundliches Schiff in Reichweite 1-3. Bis zum Ende der Phase wird dieses Schiff behandelt, als hätte es einen Pilotenwert von 12.'''
        "Kyle Katarn":
            text: """Zu Beginn der Kampfphase darfst du einem anderen freundlichen Schiff in Reichweite 1-3 einen deiner Fokusmarker geben."""
        "Jan Ors":
            text: """Wenn ein anderes freundliches Schiff in Reichweite 1-3 angreift und du keine Stressmarker hast, darfst du 1 Stressmarker nehmen, damit dieses Schiff 1 zusätzlichen Angriffswürfel erhält."""
        "Scimitar Squadron Pilot":
            name: "Pilot der Scimitar-Staffel"
        "Gamma Squadron Pilot":
            name: "Pilot der Gamma-Staffel"
        "Captain Jonus":
            text: """Wenn ein anderes freundliches Schiff in Reichweite 1 mit einer Sekundärwaffe angreift, darf es bis zu 2 Angriffswürfel neu würfeln."""
        "Major Rhymer":
            text: """Beim Angreifen mit einer Sekundärwaffe darfst du die Reichweite der Waffe um 1 erhöhen oder verringern, bis zu einer Reichweite von 1-3."""
        "Captain Kagi":
            text: """Wenn ein feindliches Schiff eine Zielerfassung durchführt, muss es wenn möglich dich als Ziel erfassen."""
        "Colonel Jendon":
            text: """Zu Beginn der Kampfphase darfst du 1 deiner blauen Zielerfassungsmarker auf ein freundliches Schiff in Reichweite 1 legen, das noch keinen blauen Zielerfassungsmarker hat."""
        "Captain Yorr":
            text: """Wenn ein anderes freundliches Schiff in Reichweite 1-2 einen Stressmarker erhalten würde und du 2 oder weniger Stressmarker hast, darfst du statt ihm diesen Marker nehmen."""
        "Omicron Group Pilot":
            name: "Pilot der Omikron-Gruppe"
        "Lieutenant Lorrir":
            ship: "TIE Abfangjäger"
            text: """Wenn du die Aktion Fassrolle ausführst, kannst du 1 Stressmarker erhalten, um die (%BANKLEFT% 1) oder (%BANKRIGHT% 1) Manöverschablone anstatt der (%STRAIGHT% 1) Manöverschablone zu benutzen."""
        "Royal Guard Pilot":
            ship: "TIE Abfangjäger"
            name: "Royal Guard Pilot"
        "Tetran Cowall":
            ship: "TIE Abfangjäger"
            text: """Immer wenn du ein %UTURN% Manöver aufdeckst, kannst du das Manöver mit einer Geschwindigkeit von "1," "3," oder "5" ausführen."""
        "Kir Kanos":
            ship: "TIE Abfangjäger"
            text: """Wenn du ein Ziel in Reichweite 2-3 angreifst, darfst du einen Ausweichmarker ausgeben, um 1 %HIT% zu deinem Wurf hinzuzufügen."""
        "Carnor Jax":
            ship: "TIE Abfangjäger"
            text: """Feindliche Schiffe in Reichweite 1 können weder Fokussierung und Ausweichen Aktionen durchführen noch Ausweichmarker und Fokusmarker ausgeben."""
        "GR-75 Medium Transport":
            name: "GR-75 Medium Transport"
        "Bandit Squadron Pilot":
            name: "Bandit Squadron Pilot"
        "Tala Squadron Pilot":
            name: "Tala Squadron Pilot"
        "Lieutenant Blount":
            name: "Leutnant Blount"
            text: """When attacking, the defender is hit by your attack, even if he does not suffer any damage."""
        "Airen Cracken":
            name: "Airen Cracken"
            text: """After you perform an attack, you may choose another friendly ship at Range 1.  That ship may perform 1 free action."""
        "Delta Squadron Pilot":
            name: "Delta Squadron Pilot"
        "Onyx Squadron Pilot":
            name: "Onyx Squadron Pilot"
        "Colonel Vessery":
            text: """When attacking, immediately after you roll attack dice, you may acquire a target lock on the defender if it already has a red target lock token."""
        "Rexler Brath":
            text: """After you perform an attack that deals at least 1 Damage card to the defender, you may spend a focus token to flip those cards faceup."""
        "Knave Squadron Pilot":
            name: "Knave Squadron Pilot"
        "Blackmoon Squadron Pilot":
            name: "Blackmoon Squadron Pilot"
        "Etahn A'baht":
            text: """When an enemy ship inside your firing arc at Range 1-3 is defending, the attacker may change 1 of its %HIT% results to a %CRIT% result."""
        "Corran Horn":
            text: """At the start of the End phase, you may perform one attack.  You cannot attack during the next round."""
        "Sigma Squadron Pilot":
            name: "Sigma Squadron Pilot"
        "Shadow Squadron Pilot":
            name: "Shadow Squadron Pilot"
        "Unspoiled PS6 TIE Phantom Pilot":
            name: "Unspoiled PS6 TIE Phantom Pilot"
        '"Whisper"':
            name: '"Whisper"'
            text: """After you perform an attack that hits, you may assign 1 focus to your ship."""
        "CR90 Corvette (Fore)":
            name: "CR90 Corvette (Fore)"
        "CR90 Corvette (Aft)":
            name: "CR90 Corvette (Aft)"
        "Wes Janson":
            text: """After you perform an attack, you may remove 1 focus, evade, or blue target lock token from the defender."""
        "Jek Porkins":
            text: """When you receive a stress token, you may remove it and roll 1 attack die.  On a %HIT% result, deal 1 facedown Damage card to this ship."""
        '"Hobbie" Kilvan':
            text: """When you acquire or spend a target lock, you may remove 1 stress token from your ship."""
        "Tarn Mison":
            text: """When an enemy ship declares you as the target of an attack, you may acquire a target lock on that ship."""
        "Jake Farrell":
            text: """After you perform a focus action or are assigned a focus token, you may perform a free boost or barrel roll action."""
        "Unspoiled PS5 A-Wing Pilot":
            name: "Unspoiled PS5 A-Wing Pilot"
            text: """This card has not yet been revealed."""
        "Keyan Farlander":
            text: """When attacking, you may remove 1 stress token to change all of your %FOCUS% results to %HIT%results."""
        "Unspoiled PS5 B-Wing Pilot":
            name: "Unspoiled PS5 B-Wing Pilot"
            text: """This card has not yet been revealed."""

    upgrade_translations =
        "Ion Cannon Turret":
            name: "Ionengeschütz"
            text: """<strong>Angriff:</strong> Greife 1 Schiff an (es muss nicht in deinem Feuerwinkel sein).<br /><br />Wenn der Angriff trifft, nimmt das verteidigende Schiff 1 Schaden und erhält 1 Ionenmarker. Dann werden alle übrigen Würfelergebnisse negiert."""
        "Proton Torpedoes":
            name: "Protonen-Torpedos"
            text: """<strong>Angriff (Zielerfassung):</strong>Gib eine Zielerfassung aus und lege diese Karte ab, um mit dieser Sekundärwaffe anzugreifen.<br /><br />Du darfst eines deiner %FOCUS% in ein %CRIT% ändern."""
        "R2 Astromech":
            name: "R2 Astromechdroide"
            text: """Du darfst alle Manöver mit Geschwindigkeit 1 und 2 wie grüne Manöver behandeln."""
        "R2-D2":
            text: """Nachdem du ein grünes Manöver ausgeführt hast, darfst du 1 Schild wiederaufladen (bis maximal zum Schildwert)."""
        "R2-F2":
            text: """<strong>Aktion:</strong> Erhöhe deinen Wendigkeitswert bis zum Ende der Spielrunde um 1."""
        "R5-D8":
            text: """<strong>Aktion:</strong> Wirf 1 Verteidigungswürfel.<br /><br />Lege bei %EVADE% oder %FOCUS% 1 deiner verdeckten Schadenskarten ab."""
        "R5-K6":
            text: """Wirf 1 Verteidigungswürfel nachdem du deine Zielerfassungsmarker ausgegeben hast.<br /><br />Bei %EVADE% nimmst du dasselbe Schiff sofort wieder in die Zielerfassung. Für diesen Angriff kannst du die Zielerfassungsmarker nicht erneut ausgeben."""
        "R5 Astromech":
            name: "R5 Astromechdroide"
            text: """Wähle während der Endphase 1 deiner offnen Schadenskarte mit dem Attribut <strong>Schiff</strong> und drehe sie um."""
        "Determination":
            name: "Entschlossenheit"
            text: """Wenn du eine offene Schadenskarte mit dem Attribut <b>Pilot</b> erhältst, wird diese sofort abgelegt (ohne dass der Kartentext in Kraft tritt)."""
        "Swarm Tactics":
            name: "Schwarmtaktik"
            text: """Wähle zu Beginn der Kampfphase 1 freundliches Schiff in Reichweite 1.<br /><br />Bis zum Ende dieser Phase wird das gewählte Schiff so behandelt, als hätte es denselben Pilotenwert wie du."""
        "Squad Leader":
            name: "Staffelführer"
            text: """<strong>Aktion:</strong> Wähle ein Schiff in Reichweite 1-2 mit einem geringeren Pilotenwert als du.<br /><br />Das gewählte Schiff darf sofort 1 freie Aktion durhführen."""
        "Expert Handling":
            name: "Flugkunst"
            text: """<strong>Aktion:</strong> Führe eine Fassrolle durch. Wenn du kein %BARRELROLL%-Symbol hast, erhälst du 1 Stressmarker.<br /><br />Dann darfst du 1 feindlichen Zielerfassungsmarker von deinem Schiff entfernen."""
        "Marksmanship":
            name: "Treffsicherheit"
            text: """<strong>Aktion:</strong> Wenn du in dieser Runde angreifst, darfst du eines deiner %FOCUS% in ein %CRIT% und alle anderen %FOCUS% in %HIT% ändern."""
        "Concussion Missiles":
            name: "Erschütterungsraketen"
            text: """<strong>Angriff (Zielerfassung):</strong> Gib deine Zielerfassungsmarker aus und lege diese Karte ab, um mit dieser Sekundärwaffe anzugreifen.<br /><br />Du darfst eine deiner Leerseiten in ein %HIT% ändern."""
        "Cluster Missiles":
            name: "Cluster-Raketen"
            text: """<strong>Angriff (Zielerfassung):</strong> Gib deine Zielerfassungsmaker aus und lege diese Karte ab, um mit dieser Sekundärwaffe <strong>zwei Mal</strong> anzugreifen."""
        "Daredevil":
            text: """<strong>Aktion:</strong> Führe ein rotes (%TURNLEFT% 1) oder (%TURNRIGHT% 1) Manöver aus.<br /><br />Wenn du kein %BOOST%-Aktionssymbol hast, musst du dann 2 Angriffswürfel werfen. Du nimmst allen gewürfelten Schaden (%HIT%) und kritischen Schaden (%CRIT%)."""
        "Elusiveness":
            name: "Schwer zu Treffen"
            text: """Wenn du verteidigst, darfst du 1 Stressmarker nehmen, um 1 Angriffswürfel zu wählen. Diesen muss der Angreifer neu würfeln.<br /><br />Du kannst diese Fähigkeit nicht einsetzen, solange du 1 oder mehrere Stressmarker hast."""
        "Homing Missiles":
            name: "Lenkraketen"
            text: """<strong>Angriff (Zielerfassung):</strong> Lege diese Karte ab, um mit dieser Sekundärwaffe anzugreifen.<br /><br />Bei diesem Angriff kann der Verteidiger keine Ausweichmarker ausgeben."""
        "Push the Limit":
            name: "Bis an die Grenzen"
            text: """Einmal pro Runde darfst du nach dem Durchführen einer Aktion eine freie Aktion aus deiner Aktionsleiste durhführen.<br /><br />Dann erhältst du 1 Stressmarker."""
        "Deadeye":
            name: "Meisterschütze"
            text: """Du darfst die Bedingung "Angriff (Zielerfassung):" in "Angriff (Fokussierung):" ändern.<br /><br />Wenn ein Angriff das Ausgeben von Zielerfassungsmarkern erfordert, darfst du stattdessen auch einen Fokusmarker ausgeben."""
        "Expose":
            name: "Aggressiv"
            text: """<strong>Aktion:</strong> Bis zum Ende der Runde steigt dein Primärwaffenwert um 1, dafür sinkt dein Wendigkeitswert um 1."""
        "Gunner":
            name: "Bordschütze"
            text: """Führe, unmittelbar nachdem du mit einem Angriff verfehlt hast, einen weiteren Angriff mit deiner Primärwaffe aus. Danach kannst du in dieser Runde nicht noch einmal angreifen."""
        "Ion Cannon":
            name: "Ionenkanonen"
            text: """<strong>Angriff:</strong> Greife 1 Schiff mit dieser Sekundärwaffe an.<br /><br />Wenn du triffst, nimmt das verteidigende Schiff 1 Schaden und erhält 1 Ionenmarker. Dann werden <b>alle</b> übrigen Würfelergebnisse negiert."""
        "Heavy Laser Cannon":
            name: "Schwere Laserkanone"
            text: """<strong>Attack:</strong> Greife 1 Schiff mit dieser Sekundärwaffe an.<br /><br />Unmittelbar nach dem Angriffswurf musst du alle %CRIT% in %HIT% ändern."""
        "Seismic Charges":
            name: "Seismische Bomben"
            text: """Nach dem Aufdecken deines Manöverrads darfst du diese Karte ablegen um 1 Seismischen Bomben-Marker zu <strong>legen</strong>.<br /><br />Der Marker <strong>detoniert</strong> am Ende der Aktivierungsphase."""
        "Mercenary Copilot":
            name: "Angeheuerter Kopilot"
            text: """Wenn du ein Ziel in Reichweite 3 angreifst, darfst du eines deiner %HIT%  in ein %CRIT% ändern."""
        "Assault Missiles":
            name: "Angriffsraketen"
            text: """Angriff (Zielerfassung): Gib deine Zielerfassungsmarker aus und lege diese Karte ab, um mit dieser Sekundärwaffe anzugreifen.<br /><br />Wenn du triffst, nimmt jedes andere Schiff in Reichweite 1 des verteidigenden Schiffs 1 Schaden."""
        "Veteran Instincts":
            name: "Veteraneninstinkte"
            text: """Dein Pilotenwert steigt um 2."""
        "Proximity Mines":
            name: "Annährungsminen"
            text: """<strong>Aktion:</strong> Lege diese Karte ab, um 1 Annährungsminen-Marker zu <strong>legen</strong>.<br /><br />Der Marker <strong>detoniert</strong>, wenn sich beim Ausführen eines Manövers die Basis eines Schiffs oder die Manöverschablone mit dem Marker überschneidet."""
        "Weapons Engineer":
            name: "Waffen-Techniker"
            text: """Du darfst 2 verschiedene Schiffe gleichzeitig in Zielerfassung haben (maximal 1 Zielerfassung pro feindlichem Schiff).<br /><br />Wenn du die Aktion Zielerfassung durchführst darfst du zwei verschiedene Schiffe als Ziele erfassen."""
        "Draw Their Fire":
            name: "Das Feuer auf mich ziehen"
            text: """Wenn ein freundliches Schiff in Reichweite 1 durch einen Angriff getroffen wird, darfst du anstelle dieses Schiffs den Schaden für 1 nicht-negiertes %CRIT% auf dich nehmen."""
        "Luke Skywalker":
            text: """Führe, unmittelbar nachdem du mit einem Angriff verfehlt hast, einen weiteren Angriff mit deiner Primärwaffe aus. Du darfst ein %FOCUS% in ein %HIT% ändern. Danach kannst du in dieser Runde nicht noch einmal angreifen."""
        "Nien Nunb":
            text: """Du darfst alle %STRAIGHT%-Manöver wie grüne Manöver behandeln."""
        "Chewbacca":
            text: """Wenn du eine Schadenskarte erhältst, darfst du sie sofort ablegen und 1 Schild wiederaufladen.<br /><br />Danach wird diese Aufwertungskarte abgelegt."""
        "Advanced Proton Torpedoes":
            name: "Verstärkte Protonen-Torpedos"
            text: """<strong>Angriff (Zielerfassung):</strong> Gib eine Zielerfassung aus und lege diese Karte ab um mit dieser Sekundärwaffe anzugreifen.<br /><br />Du darfst bis zu 3 deiner Leerseiten in %FOCUS% ändern."""
        "Autoblaster":
            name: "Repertierblaster"
            text: """<strong>Angriff:</strong> Greife 1 Schiff mit dieser Sekundärwaffe an.<br /><br />Deine %HIT% können von Verteidigungswürfeln nicht negiert werden.<br /><br />Der Verteidiger darf %CRIT% negieren, bevor alle %HIT% negiert wurden."""
        "Fire-Control System":
            name: "Feuerkontrollsystem"
            text: """Nachdem du angegriffen hast, darfst du eine Zielerfassung auf den Verteidiger durchführen."""
        "Blaster Turret":
            name: "Blastergeschütz"
            text: """<strong>Angriff (Fokussierung):</strong> Gib 1 Fokusmarker aus, um 1 Schiff mit dieser Sekundärwaffe anzugreifen (es muss nicht in deinem Feuerwinkel sein)."""
        "Recon Specialist":
            name: "Aufklärungs-Experte"
            text: """Wenn du die Aktion Fokussieren durchführst, lege 1 zusätzlichen Fokusmarker neben dein Schiff."""
        "Saboteur":
            text: """<strong>Aktion:</strong> Wähle 1 feindliches Schiff in Reichweite 1 und wirf 1 Angriffswürfel. Bei %HIT% oder %CRIT%, wähle 1 zufällige verdeckte Schadenskarte des Schiffs, decke sie auf und handle sie ab."""
        "Intelligence Agent":
            name: "Geheimagent"
            text: """Wähle zu Beginn der Aktivierungsphase 1 feindliches Schiff in Reichweite 1-2. Du darfst dir das ausgewählte Manöver dieses Schiffs ansehen."""
        "Proton Bomb":
            name: "Protonenbomben"
            text: """Nach dem Aufdecken deines Manöverrads darfst du diese Karte ablegen um 1 Protonenbomben-Marker zu <strong>legen</strong>.<br /><br />Der Marker <strong>detoniert</strong> am Ende der Aktivierungsphase."""
        "Adrenaline Rush":
            name: "Adrenalinschub"
            text: """Wenn du ein rotes Manöver aufdeckst, darfst du diese Karte ablegen, um das Manöver bis zum Ende der Aktivierungsphase wie ein weißes Manöver zu behandeln."""
        "Advanced Sensors":
            name: "Verbesserte Sensoren"
            text: """Unmittelbar vor dem Aufdecken deines Manövers darfst du 1 freie Aktion durchführen.<br /><br />Wenn du diese Fähigkeit nutzt, musst du den Schritt "Aktion durchführen" in dieser Runde überspringen."""
        "Sensor Jammer":
            name: "Störsender"
            text: """Beim Verteidigen darfst du eines der %HIT% des Angreifers in ein %FOCUS% ändern.<br /><br />Der Angreifer darf den veränderten Würfel nicht neu würfeln."""
        "Darth Vader":
            text: """Nachdem du ein feindliches Schiff angegriffen hast, darfst du 2 Schaden nehmen, damit dieses Schiff 1 kritischen Schaden nimmt."""
        "Rebel Captive":
            name: "Gefangener Rebell"
            text: """Ein Mal pro Runde erhält das erste Schiff, das einen Angriff gegen dich ansagt, sofort 1 Stressmarker."""
        "Flight Instructor":
            name: "Fluglehrer"
            text: """Beim Verteidigen darfst du 1 deiner %FOCUS% neu würfeln. Hat der Angreifer einen Pilotenwert von 2 oder weniger, darfst du stattdessen 1 deiner Leerseiten neu würfeln."""
        "Navigator":
            name: "Navigator"
            text: """Nach dem Aufdecken deines Manöverrads darfst du das Rad auf ein anderes Manöver mit gleicher Flugrichtung drehen.<br /><br />Wenn du bereits Stressmarker hast, darfst du es nicht auf ein rotes Manöver drehen."""
        "Opportunist":
            name: "Opportunist"
            text: """Wenn du angreifst und der Verteidiger keine Fokusmarker oder Ausweichmarker hat, kannst du einen Stressmarker nehmen, um einen zusätzlichen Angriffswürfel zu erhalten.<br /><br />Du kannst diese Fähigkeit nicht nutzen, wenn du einen Stressmarker hast."""
        "Comms Booster":
            name: "Comms Booster"
            text: """<strong>Energy:</strong> Spend 1 energy to remove all stress tokens from a friendly ship at Range 1-3.  Then assign 1 focus token to that ship."""
        "Slicer Tools":
            name: "Slicer Tools"
            text: """<strong>Action:</strong> Choose 1 or more ships at Range 1-3 that have a stress token.  For each ship chosen, you may spend 1 energy to cause that ship to suffer 1 damage."""
        "Shield Projector":
            name: "Shield Projector"
            text: """When an enemy ship is declaring either a small or large ship as the target of its attack, you may spend 3 energy to force that ship to target you if possible."""
        "Ion Pulse Missiles":
            name: "Ion Pulse Missiles"
            text: """<strong>Attack (target lock):</strong> Discard this card to perform this attack.<br /><br />If this attack hits, the defender suffers 1 damage and receives 2 ion tokens.  Then cancel <strong>all<strong> dice results."""
        "Wingman":
            name: "Wingman"
            text: """At the start of the Combat phase, remove 1 stress token from another friendly ship at Range 1."""
        "Decoy":
            name: "Decoy"
            text: """This card has not yet been released."""
        "Outmaneuver":
            name: "Outmaneuver"
            text: """When attacking a ship inside your firing arc, if you are not inside that ship's firing arc, reduce its agility value by 1 (to a minimum of 0)."""
        "Predator":
            name: "Predator"
            text: """When attacking, you may reroll 1 attack die.  If the defender's pilot skill value is "2" or lower, you may instead reroll up to 2 attack dice."""
        "Flechette Torpedoes":
            name: "Flechette Torpedoes"
            text: """<strong>Attack (target lock):</strong> Discard this card and spend your target lock to perform this attack.<br /><br />After you perform this attack, the defender receives 1 stress token if its hull value is "4" or lower."""
        "R7 Astromech":
            name: "R7 Astromech"
            text: """Once per round when defending, if you have a target lock on the attacker, you may spend the target lock to choose any or all attack dice.  The attacker must reroll the chosen dice."""
        "R7-T1":
            name: "R7-T1"
            text: """<strong>Action:</strong> Choose an enemy ship at Range 1-2.  If you are inside that ship's firing arc, you may acquire a target lock on that ship.  Then, you may perform a free boost action."""
        "Tactician":
            name: "Tactician"
            text: """This card has not yet been released."""
        "R2-D2 (Crew)":
            name: "R2-D2 (Crew)"
            text: """At the end of the End phase, if you have no shields, you may recover 1 shield and roll 1 attack die.  On a %HIT% result, randomly flip 1 of your facedown Damage cards faceup and resolve it."""
        "C-3PO":
            name: "C-3PO"
            text: """Once per round, before you roll 1 or more defense dice, you may guess aloud a number of %EVADE% results.  If you roll that many %EVADE% results (before modifying dice), add 1 %EVADE% result."""
        "Single Turbolasers":
            name: "Single Turbolasers"
            text: """<strong>Attack (Energy):</strong> Spend 2 energy from this card to perform this attack.  The defender doubles his agility value against this attack.  You may change 1 of your %FOCUS% results to a %HIT% result."""
        "Quad Laser Cannons":
            name: "Quad Laser Cannons"
            text: """<strong>Attack (Energy):</strong> Spend 1 energy from this card to perform this attack.  If this attack does not hit, you may immediately spend 1 energy from this card to perform this attack again."""
        "Tibanna Gas Supplies":
            name: "Tibanna Gas Supplies"
            text: """<strong>Energy:</strong> You may discard this card to gain 3 energy."""
        "Ionization Reactor":
            name: "Ionization Reactor"
            text: """<strong>Energy:</strong> Spend 5 energy from this card and discard this card to cause each other ship at Range 1 to suffer 1 damage and receive 1 ion token."""
        "Engine Booster":
            name: "Engine Booster"
            text: """Immediately before you reveal your maneuver dial, you may spend 1 energy to execute a white (%STRAIGHT% 1) maneuver.  You cannot use this ability if you would overlap another ship."""
        "R3-A2":
            name: "R3-A2"
            text: """When you declare the target of your attack, if the defender is inside your firing arc, you may receive 1 stress token to cause the defender to receive 1 stress token."""
        "R2-D6":
            name: "R2-D6"
            text: """Your upgrade bar gains the %ELITE% upgrade icon.<br /><br />You cannot equip this upgrade if you already have a %ELITE% upgrade icon or if your pilot skill value is "2" or lower."""
        "Enhanced Scopes":
            name: "Enhanced Scopes"
            text: """During the Activation phase, treat your pilot skill value as "0"."""
        "Chardaan Refit":
            name: "Chardaan Refit"
            text: """This card has a negative squad point cost."""
        "Proton Rockets":
            name: "Proton Rockets"
            text: """This card has not yet been revealed."""
        "Kyle Katarn":
            text: """After you receive a stress token from your ship, you may assign a focus token to ???"""
        "Jan Ors":
            text: """This card has not yet been revealed."""
        "Toryn Farr":
            text: """<strong>Action:</strong> Spend any amount of energy to choose that many enemy ships at Range 1-2.  Remove all focus, evade, and blue target lock tokens from those ships."""
        # TODO Check card formatting
        "R4-D6":
            text: """When you are hit by an attack and there are at least 3 uncanceled %HIT% results, you may choose to cancel those results until there are 2 remaining.  For each result canceled this way, receive 1 stress token."""
        "R5-P9":
            text: """At the end of the Combat phase, you may spend 1 of your focus tokens to recover 1 shield (up to your shield value)."""
        "WED-15 Repair Droid":
            text: """<strong>Action:</strong> Spend 1 energy to discard 1 of your facedown Damage cards, or spend 3 energy to discard 1 of your faceup Damage cards."""
        "Carlist Rieekan":
            text: """At the start of the Activation phase, you may discard this card to treat each friendly ship's pilot skill value as "12" until the end of the phase."""
        "Jan Dodonna":
            text: """When another friendly ship at Range 1 is attacking, it my change 1 of its %HIT% results to a %CRIT%."""
        "Expanded Cargo Hold":
            text: """Once per round, when you would be dealt a faceup Damage card, you may draw that card from either the fore or aft Damage deck."""
        "Backup Shield Generator":
            text: """At the end of each round, you may spend 1 energy to recover 1 shield (up to your shield value)."""
        "EM Emitter":
            text: """When you obstruct an attack, the defender rolls 3 additional defense dice (instead of 1)."""
        "Frequency Jammer":
            text: """When you perform a jam action, choose 1 enemy ship that does not have a stress token and is not at Range 1 of the jammed ship.  The chosen ship receives 1 stress token."""

    modification_translations =
        "Stealth Device":
            name: "Tarnvorrichtung"
            text: """Dein Wendigkeitswert steigt um 1. Lege diese Karte ab, wenn du von einem Angriff getroffen wirst."""
        "Shield Upgrade":
            name: "Verbesserte Schilde"
            text: """Dein Schildwert steigt um 1."""
        "Engine Upgrade":
            name: "Verbessertes Triebwerk"
            text: """Füge deiner Aktionsleiste ein %BOOST%-Symbol hinzu."""
        "Anti-Pursuit Lasers":
            name: "Kurzstreckenlaser"
            text: """Nachdem ein feindliches Schiff ein Manöver ausgeführt hat, das zur Überschneidung mit deinem Schiff führt, wirf 1 Angriffswürfel. Bei %HIT% oder %CRIT% nimmt das feindliche Schiff 1 Schaden."""
        "Targeting Computer":
            name: "Zielerfassungssystem"
            text: """Deine Aufwertungsleiste erhält das %TARGETLOCK%-Symbol."""
        "Hull Upgrade":
            name: "Verbesserte Hülle"
            text: """Erhöhe deinen Hüllenwert um 1."""
        "Munitions Failsafe":
            name: "Munitions Failsafe"
            text: """When attacking with a secondary weapon that instructs you to discard it to perform the attack, do not discard it unless the attack hits."""
        "Stygium Particle Accelerator":
            name: "Stygium Particle Accelerator"
            text: """When you either decloak or perform a cloak action, you may perform a free evade action."""
        "Advanced Cloaking Device":
            name: "Advanced Cloaking Device"
            text: """After you perform an attack, you may perform a free cloak action."""
        "Combat Retrofit":
            text: """Increase your hull value by 2 and your shield value by 1."""


    title_translations =
        "Slave I":
            name: "Sklave I"
            text: """Füge deiner Aktionsleiste ein %TORPEDO%-Symbol hinzu."""
        "Millennium Falcon":
            name: "Millennium Falke"
            text: """Füge deiner Aktionsleiste ein %EVADE%-Symbol hinzu."""
        "Moldy Crow":
            text: """In der Endphase werden von diesem Schiff keine unbenutzen Fokusmarker entfernt."""
        "ST-321":
            text: """Wenn du eine Zielerfassung durchführst, darfst du ein beliebiges feindliches Schiff auf der Spielfläche als Ziel erfassen."""
        "Royal Guard TIE":
            name: "TIE der Roten Garde"
            ship: "TIE Abfangjäger"
            text: """Du kannst bis zu 2 verschiedene Modifikationen verwenden (statt einer).<br /><br />Du kannst diese Karte nicht verwenden, wenn der Pilotenwert "4" oder kleiner ist."""
        "Dodonna's Pride":
            name: "Dodonna's Pride"
            text: """When you perform a coordinate action, you may choose 2 friendly ships (instead of 1).  Those ships may each perform 1 free action."""
        "A-Wing Test Pilot":
            name: "A-Wing Test Pilot"
            text: """Your upgrade bar gains 1 %ELITE% upgrade icon.<br /><br />You cannot equip 2 of the same %ELITE% Upgrade cards.  You cannot equip this if your pilot skill value is "1" or lower."""
        "B-Wing/E":
            text: """Your upgrade bar gains the %CREW% upgrade icon."""
        "Tantive IV":
            text: """Your fore section upgrade bar gains 1 additional %CREW% and 1 additional %TEAM% upgrade icon."""
        "Bright Hope":
            text: """A reinforce action assigned to your fore section adds 2 %EVADE% results (instead of 1)."""
        "Quantum Storm":
            text: """At the start of the End phase, if you have 1 or fewer energy tokens, gain 1 energy token."""
        "Dutyfree":
            text: """When performing a jam action, you may choose an enemy ship at Range 1-3 (instead of at Range 1-2)."""

    exportObj.setupCardData basic_cards, pilot_translations, upgrade_translations, modification_translations, title_translations

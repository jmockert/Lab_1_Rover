`timescale 1ns / 1ps

//Main

module States(
input clk,
input
input
input

output
output
output
output
    );

//reg [31:0] count;

parameter // Lists All The Differnt States And Their Line Numbers

WFB = 0; // Ready State (Waits on Button Press) // Line 68
BTH = 1; // Starts Forward Motion Of Rover // Line 80
LRSD = 2; // Single Motor Surge Detected // Line 128
CSD = 3; // Both Motor Surge Detected // Line 104
LIRD = 4; // Left IR Sensor Triggered // Line 155
RIRD = 5; // Right IR Sensor Triggered // Line 174
IPSD = 6; // IPS Triggered // Line 191
ELEON = 7; // Electromagnet Turned On // Line 201
SUP = 8; // Servo Moved to Up Position (Started in Down Position) // Line
CSON = 9; // Color Sensor Begings Taking Values for Determination // Line 219
RGBYD = 10; // Color Or Nothing Determined // Line 249
BSIR = 11; // Beacon Search Mode Detected/Searching For Red Beacon // Line
BSIG = 12; // Beacon Search Mode Detected/Searching For Green Beacon // Line
BSIB = 13; // Beacon Search Mode Detected/Searching For Blue Beacon // Line
BSIY = 14; // Beacon Search Mode Detected/Searching For Yellow Beacon // Line
AAB = 15; // Rover Reaches Beacon Corner // Line
ELEOFF = 16; // Turns Electromagnet Off // Line
SPD = 17; // Servo Returned To Down Position // Line
CFW = 18; // Counter For Washer To Determine Progress // Line
TAS = 19; // Turns The Rover Around Before Resuming Hunt // Line
DOR = 20; // All Four Washers Have Been Delivered (Goal Achieved) // Line

reg [5:0] state = Ready;
reg [1:0] Color;

// Instantiate all modules



always @ (posedge clk)  

// Set Up All Clocks Here


    
 case (state)
        
      WFB: // Fire Breathing Rubber Ducky Ready To Hunt 
          begin 
                
             Direction = 4'b0000; //Ready To Search for Prey!
             
             led[0] = 1; // Confirming Bloodlust 
                
             if (btnC == 1)
                state = BTH; // Begin The Hunt!!!
                
          end
             
      BTH:  // Let The Hunt Commence!!! (Dun Dun Dunnnnnnn)
          begin
          
             led[0] = 0; //Stealth Activated...
             
             Direction = 4'b0110; // Following Tracks...
             
             if(IPSout == 1) // IPS Triggered
                state == IPSD; // To IPS State 
             
             if (IRL == 1) // Left IR Triggered // Set Directly to Pmod Pin
                state = LIRD; // To Left IR state
                
             if (IRR == 1) // Right IR Triggered // Set Directly to Pmod Pin
                state = RIRD; // To Right IR State
                
             if (CurrentSurgeL == 1 || CurrentSurgeR == 1) // One Motor Surge Detected // Mainly For Turning Problems
                state = LRSD; // To Single Motor Surge State
                
             if (CurrentSurge == 1) // Current Surge Of Both Motors Detected
                state = CSD; // To Both Motor Surge State
                
          end      
                
      CSD: // Both Motor Surge Detected
          begin
 
            if (AABF = 1) // Only Used During Approach To Beacon
          
               for (countRR < ReverseR) // Reverse Right For Half A Second
                    Direction = 4'b0100; TEST Value  
                    
                    if (countMaxRR  maxRR) // Forward For A Second
                        Direction = 4'b0110
                        
                            if (countFL <
          
            if (IPSout == 1) // Metal Was Detected
                state = IPSD; // To IPS State
          
               for (count < Reverse) // Back the rover up for a second
                    Direction = 4'b1001; // Reverses FBRD
                  
                      if (count = maxB) // max value reached and trigger done
                          done_temp1 = 1; // Temporary Flag For Triggering Next State
                      
             if (done_temp1 == 1)
             
                for (count < ReverseL) // After Backing Up For A Second, Back Up To The Right
                    Direction = 4'b0100; Test Rover Backup Config!!!
                    
                    if (count = maxBR) // After Backed Up, Back to Hunting
                        state = BTH; // Back on The Prowl!!!
             
          dont_temp1 = 0;
          AABF = 0;   
                            
          end
          
     LRSD: 
          begin
          
             if (IPSout == 1) // IPS detection
              state = IPSD;
          
             if (LSD == 1)
                
                for (count < ReverseL) 
                    Direction = 4'b0100; Test Rover Backup Config!!!
                      
                    if (count < maxBL)
                        doneF1 = 1;  // Done Flag Trigger 
                        
             if (RSD == 1)
            
                for (count < ReverseR)
                    Direction = 4'b0001; Test Rover Backup Config!!!
                  
                    if (count < maxBR)
                        doneF2 = 1; // Done Flag Trigger    
               
             if (doneF1 || doneF2) // Done Flags Intiate Return to Hunt State
                state = BTH; // Back to Hunting!
                
             doneF1 = 0;
             doneF2 = 0;   
                
          end     
                
     LIRD:         
          begin
          
            if (IPSout == 1) // IPS detection
               state = IPSD          
                
               for (countFR1 < ForwardR1) // Turn Right ~ 90 Degrees  
                   Direction = 4'b0101; 
                   
                        if (countFR1 = FowardR1) // After Turning ~ 90 Degrees Starts Forward Movement For A Second
                           
                           for (countFR2 < ForwardR2) // Moving Forward For A Second
                                Direction = 4'b0110;
                                
                                if (countFR2 = ForwardR2) // When Done Moving Forward For A Second
                                   
                                   for (countFR3 < ForwardR3) // Turn Right Again ~ 90 Degrees
                                        Direction =4'b0101;
                                        
                                        if (countFR3 = ForwardR3) // Two Right Turns Completed
                                            doneFRL = 1;
                
                if (doneFRL = 1)
                   state = BTH;         
                
             doneFRL = 0;   
                
          end
          
     RIRD:
          begin

            if (IPSout == 1) // IPS detection
               state = IPSD          
                
               for (countFL1 < ForwardL1) // Turn Left ~ 90 Degrees  
                   Direction = 4'b1010; 
                   
                        if (countFL1 = FowardL1) // After Turning ~ 90 Degrees Starts Forward Movement For A Second
                           
                           for (countFL2 < ForwardL2) // Moving Forward For A Second
                                Direction = 4'b0110;
                                
                                if (countFL2= ForwardL2) // When Done Moving Forward For A Second Begin Second Left Turn
                                   
                                   for (countFL3 < ForwardL3) // Turn Left Again ~ 90 Degrees
                                        Direction =4'b1010;
                                        
                                        if (countFL3 = ForwardL3) // Two Left Turns Completed
                                            doneFRR = 1;
              
            if (doneFRR = 1)
                state = BTH; // Back To Hunting        
          
          doneFRR = 0;
          end                     
                
     IPSD:
          begin
          
             Direction = 4'b0000; // Once IPS detects metal, FBRD stops
             
             state = ELEON; // To Electromagnet State
          
         end      
    
    ELEON:
          begin
          
             Electro = 1; // Electromagent Pmod Pin Set To High
             
             state = SUP; // To Servo Position Up State
             
          end
          
      SUP: // Servo Position Up State
          begin
          
             Servo = Position1; // Raises Electromagnet Arm For Color Sensor To Detect A Color
             
             state = CSON; // To Color Sensor State
             
          end
          
     CSON: // Color Sensor State
          begin
          
          for (countCS < maxCS) // Waits A Couple Of Seconds To Let Color Senesor Detect Washer Color
               CSGO = 0;
                
               if (countCS = maxCS) // After Color Has Rotated Through Filters And Determined Color
               CSGO = 1;
               
               if (CSGO == 1) // Begins Selection
                    
                    case(Color) // Set up case statement !!!
          
                     if (colorR == 1)
                        RedBeacon == 1;
                
                        state = RGBYD; 
                    
                     else if (colorG == 1)
                         GreenBeacon == 1;
                   
                         state = RGBYD;
                    
                     else if (colorB == 1)
                         BlueBeacon == 1; 
                
                         state = RGBYD;
                    
                     else if (colorY == 1);
                         YellowBeacon == 1;
                
                         state = RGBYD;
                    
                     else if (Nothing == 1)
                         NothingV == 1;
                
                         state == ELEOFF;        
                
          end
          
     RGBYD:
           begin
          
              if (RedBeacon == 1)
                  state = BSIR;
                
              else if (GreenBeacon == 1)
                  state = BSIG;
                
              else if (BlueBeacon == 1)
                  state = BSIB;
                
              else if (YellowBeacon == 1);
                  state = BSIY;
                
           end                   
      
      BSIR:
           begin
           
           RedBeacon = 0;
         
              while not (BeaconRS == 1)
                  Direction = 4'b0101;
                
                    if (BeaconRS ==1)
                        Direction = 4'b0110;
                        
                        state = AAB; // To Approaching Beacon State
                   
           end        
    
      BSIG:
           begin
           
           GreenBeacon = 0;
              
              while not (BeaconGS == 1)
                  Direction = 4'b0101;
                     
                     if (BeaconGS ==1)
                        Direction = 4'b0110;
                             
                        state = AAB; // To Approaching Beacon State
                     
           end 
                
      BSIB:
           begin
           
           BlueBeacon = 0; 
                   
              while not (BeaconBS == 1)
                  Direction = 4'b0101;
                          
                     if (BeaconBS ==1)
                        Direction = 4'b0110;
                                  
                        state = AAB; // To Approaching Beacon State
                          
           end 
                   
      BSIY:
           begin
           
           YellowBeacon = 0;
                        
              while not (BeaconYS == 1)
                  Direction = 4'b0101;
                               
                     if (BeaconYS ==1)
                        Direction = 4'b0110;
                                       
                        state = AAB; // To Approaching Beacon State
                               
            end  
          
        AAB: // For Approaching The Determined Beacon                                      
            begin
            
                if (CurrentSurgeL == 1 || CurrentSurgeR == 1) // Incase An Object Is Run Into On One Motor While Moving Towards Beacon
                    AABF = 1;
                    state = LSRD;
                    
                else if (CurrentSurge == 1) // Incase An Object Is Run Into With Both Motors While Moving Towards Beacon
                    AABF = 1;
                    state = CSD;
            
                else if (RPRIR == 1) // IR Sensor Is Triggered On RPR 220
                    Direction = 4'b0000;
                    state = ELEOFF;
                    
            end
            
     ELEOFF: // Electromagnet Off State
            begin
            
                Electro = 0; // Electromagnet Turned Off // Assigned Straight To Electromagnet Pin 
                
                state = SPD; // To Servo Down Position
                
            end
            
        SPD: // Servo Position Down State
            begin
            
            
               if (NothingV == 1) // Only Used If Color Sensor Does Not Detect Washer Color
                    state = BTH; // Returns To Hunting For A Washer
                    
               else
                  Servo = Position0; // Lowers The Servo To The Down Position
                
                  state = CFW; // Goes To Counter State
               
               NothingV = 0;
                  
            end      
            
        CFW:  // Counter For Determining Washers Progress     
            begin          
            
                    DoneCount = DoneCount + 1; // Everytime The State Is Entered, Counter Ticks Up One
                    
                    if(DoneCount != 4) // Under Washer Count Lower Than Four
                        state = TAS; // Another Scent Found
                        
                    else if (DoneCount == 4)
                        state = DOR; // Hunting For Prey Completed
                        
            end
            
        TAS: // Turn Around State
            begin
            
                for (countTA < TurnAround) // Turns ~ 180 Degrees
                    Direction = 4'b1010;
                    
                    if (countTA = TurnAround) // Stops After Turning
                        Direction = 4'b0000;
                        
                        state = DOR;
                        
            end         
            
        DOR: // Done Or Ready State
            begin
            
                Direction = 4'b0000; // The Hunt Has Ended! Time for Rest
                
                state = WFB; // Waiting For The Next Hunt...
                
            end            
    
endmodule

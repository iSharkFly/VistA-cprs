JFW Script File                                                            '  �    gethandlefromaddress             '     %       %    stringsegment   '  %   '  %       
  # � %        
  
        %    stringtoint      
  '     %    getfirstchild   '  %        
 
    %       
  '     %    getnextwindow   '   �    %       
  '     %       %    stringsegment   '   d    %     	      �     getcurrentpagehandle            getfocus      getrealwindow   '      %     getwindowclass   TfrmFrame   
        %    1 1 1     gethandlefromaddress       	               	             yankstring       �   %           %    stringlength      substring   %  
  '  %        %      %    stringlength         
     %     stringlength       %    stringlength    
    substring      	      %      	         �    stripcontrols       � � �%   '     %   LeftAlt+    %    yankstring  '  %          %   RightAlt+   %    yankstring  '        %   LeftControl+    %    yankstring  '  %          %   RightControl+   %    yankstring  '        %   LeftShift+  %    yankstring  '  %          %   RightShift+ %    yankstring  '     %     	      �     newtextevent                %     getwindowclass  '  %   TORComboEdit    
        %   %  %  %  %  %  %    newtextevent             �    focuschangedevent          %     getrealwindow   '       getcurrentpagehandle    '     %    getwindowclass   TfrmCover   
     $  covervitalsid         
        %   1 1 2 1 2     gethandlefromaddress    '     %    getcontrolid    &  covervitalsid            %    getwindowclass   TfrmMeds    
     $  medsinpatientid       
           %   2 3   gethandlefromaddress      getcontrolid    &  medsinpatientid    $  medsoutpatientid          
           %   1 2   gethandlefromaddress      getcontrolid    &  medsoutpatientid             %    getwindowclass   TfrmODProc  
     $  odprocreasonforrequestid          
        %   16 1      gethandlefromaddress    '     %    getcontrolid    &  odprocreasonforrequestid       $  odprocinpatientid         
        %   12    gethandlefromaddress    '     %    getcontrolid    &  odprocinpatientid      $  odprocoutpatientid        
        %   11    gethandlefromaddress    '     %    getcontrolid    &  odprocoutpatientid           %    getwindowclass   TfrmODCslt  
     $  odcsltreasonforcsltid         
        %   21 1      gethandlefromaddress    '     %    getcontrolid    &  odcsltreasonforcsltid      $  odcsltoutpatientid        
        %   1 2   gethandlefromaddress    '     %    getcontrolid    &  odcsltoutpatientid     $  odcsltinpatientid         
        %   1 1   gethandlefromaddress    '     %    getcontrolid    &  odcsltinpatientid            %    getwindowclass   TfrmPtCWAD  
     $  ptcwadallergiesid         
        %   5     gethandlefromaddress    '     %    getcontrolid    &  ptcwadallergiesid            %    getwindowclass   TfrmPtSel   
     $  ptselnotificationsid          
        %   1     gethandlefromaddress    '     %    getcontrolid    &  ptselnotificationsid             %    getwindowclass   TfrmTemplateEditor  
     $  templateeditorblanklinesid        
        %   4 3 1 1 11    gethandlefromaddress    '     %    getcontrolid    &  templateeditorblanklinesid           %    getwindowclass   TfrmODMeds  
     $  odmedscommentsid          
        %   1 1 9     gethandlefromaddress          
        %   1 1 7     gethandlefromaddress    '     %    getcontrolid    &  odmedscommentsid          $  odmedspriorityid          
        %   1 1 2 2   gethandlefromaddress    '     %    getcontrolid    &  odmedspriorityid             %    getwindowclass   TfrmConsultsByStatus    
     $  consultsbystatusstatusid          
        %   1 4   gethandlefromaddress    '     %    getcontrolid    &  consultsbystatusstatusid             %    getwindowclass   TfrmConsultAction   
     $  consultactioncommentsid       
        %   1 1 2 3   gethandlefromaddress    '     %    getcontrolid    &  consultactioncommentsid    $  consultactionalertid          
        %   1 1 2 1 1     gethandlefromaddress    '     %    getcontrolid    &  consultactionalertid             %     getwindowclass  '  %   TORListBox  
        %     getcontrolid    '  %  $  covervitalsid   
         Vitals    saystring         %  $  ptcwadallergiesid   
         Allergies     saystring         %  $  consultsbystatusstatusid    
         Status    saystring            %     getwindowtype     saystring            %           getwindowtext     saystring      	         %   TCaptionRichEdit    
        %     getcontrolid    '  %  $  odprocreasonforrequestid    
         Reason for Request    saystring            %   TRichEdit   
        %     getcontrolid    '  %  $  odcsltreasonforcsltid   
         Reason for Request    saystring            %   TRadioButton    
        %     getcontrolid    '  %  %  
  $  odcsltoutpatientid  
  " l$  odprocinpatientid   
  " �%  $  odprocoutpatientid  
  
  " �%  $  odcsltinpatientid   
  
         Patient will be seen as an    saystring            %   TCaptionListView    
        %     getcontrolid    '  %  $  ptselnotificationsid    
         Notifications     saystring            %   TCaptionEdit    
        %     getcontrolid    '  %  $  templateeditorblanklinesid  
         Number of blank lines to insert between items     saystring            %     getwindowtype     saystring            %           getwindowtext     saystring      	         %   TCaptionListBox 
        %     getcontrolid    '  %  $  medsinpatientid 
         Inpatient Medications     saystring         %  $  medsoutpatientid    
         Outpatient Medications    saystring            %   TCaptionMemo    
        %     getcontrolid    '  %  $  odmedscommentsid    
         Comments      saystring         %  $  consultactioncommentsid 
         Comments      saystring            %   TORComboEdit    
        %     getcontrolid    '  %  $  odmedspriorityid    
         Priority      saystring            %     getwindowtype     saystring            %           getwindowtext     saystring      	         %   TCheckBox   
        %     getcontrolid    '  %  $  consultactionalertid    
              %     getnextwindow     getwindowname     saystring               %   %    focuschangedevent         �    autostartevent        &  covervitalsid         &  odprocreasonforrequestid          &  odprocinpatientid         &  odprocoutpatientid        &  odcsltreasonforcsltid         &  odcsltinpatientid         &  odcsltoutpatientid        &  ptcwadallergiesid         &  ptselnotificationsid          &  templateeditorblanklinesid        &  medsinpatientid       &  medsoutpatientid          &  odmedscommentsid          &  odmedspriorityid          &  notesviewmenuid       &  consultsbystatusstatusid          &  consultactioncommentsid       &  consultactionalertid          &  currentmenucontext       autostartevent        �    menubartomenucontext               getcurrentpagehandle      getwindowclass  '  %   TfrmNotes   
     %    A   
          &  currentmenucontext     %    V   
          &  currentmenucontext        %   TfrmConsults    
     %    A   
          &  currentmenucontext     %    V   
          &  currentmenucontext               keypressedevent          %  %  %  %    stripcontrols   '          getcurrentpagehandle      getwindowclass  '  %   TfrmNotes   
  # � %   A   
  
  # � %  
  # � %  
  # � %    
         Saving note without signature     saystring         $  globalmenumode       
  " |$  globalmenumode        
  # x%  
  
  ' 	 % 	       %    menubartomenucontext          $  currentmenucontext       
     %   A   
         Saving note without signature     saystring            &  currentmenucontext        %    menubartomenucontext             $  currentmenucontext       
     %   D   
         Toggling note details     saystring            &  currentmenucontext        %    menubartomenucontext             $  currentmenucontext       
     %   C   
          &  currentmenucontext        %    menubartomenucontext             $  currentmenucontext       
     %   T   
         Displaying consult details    saystring            &  currentmenucontext     %   U   
         Displaying consult results    saystring            &  currentmenucontext        %    menubartomenucontext             $  currentmenucontext       
     %   F   
         Returning to default view     saystring            &  currentmenucontext        %    menubartomenucontext                   %   %  %  %    keypressedevent       |     menumodeevent       %        
           &  currentmenucontext        %   %    menumodeevent         
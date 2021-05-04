function [] = finalProjectGUI()
close all

global gui; %declare global

gui.fig = figure(); %initialize the figure
gui.p = plot(0,0); %new figure: make an empty plot
gui.p.Parent.Position = [0.2 0.25 0.7 0.7];
    
    gui.titleText = uicontrol('style','text','position',[20 380 50 20],'string','Plot Title:','horizontalalignment','right');
    gui.titleEdit = uicontrol('style','edit','position',[80 380 450 20]);
    %making the box for the title edit and putting the title text near it
    gui.xDataText = uicontrol('style','text','position',[20 350 50 20],'string','X Values:','horizontalalignment','right'); 
    gui.xDataEdit = uicontrol('style','edit','position',[80 350 450 20]);
    %making the box for the x data edit and putting the x data text near it
    gui.yDataText = uicontrol('style','text','position',[20 320 50 20],'string','Y Values:','horizontalalignment','right');
    gui.yDataEdit = uicontrol('style','edit','position',[80 320 450 20]);
    %making the box for the y data edit and putting the y data text near it
    gui.xLabelText = uicontrol('style','text','position',[20 290 50 20],'string','X Label:','horizontalalignment','right');
    gui.xLabelEdit = uicontrol('style','edit','position',[80 290 450 20]);
    %making the box for the x label edit and putting the x label text near it
    gui.yLabelText = uicontrol('style','text','position',[20 260 50 20],'string','Y Label:','horizontalalignment','right');
    gui.yLabelEdit = uicontrol('style','edit','position',[80 260 450 20]);
    %making the box for the y label edit and putting the y label text near it
    gui.xLimText = uicontrol('style','text','position',[20 230 50 20],'string','X Lim:','horizontalalignment','right');
    gui.xLimEdit = uicontrol('style','edit','position',[80 230 220 20]);
    %making the box for the x limit edit and putting the x limit text near it
    gui.yLimText = uicontrol('style','text','position',[250 230 50 20],'string','Y Lim:','horizontalalignment','right');
    gui.yLimEdit = uicontrol('style','edit','position',[310 230 220 20]);
    %making the box for the y limit edit and putting the y limit text near it
    gui.typeText = uicontrol('style','text','position',[200 200 50 20],'string','Type:','horizontalalignment','right');
    gui.typeMenu = uicontrol('style','popupmenu','position',[260 200 60 20],'string',{'o','x','*','-','--'},'horizontalalignment','center');
    %making menus and texts for the type
    gui.colorMenu = uicontrol('style','popupmenu','position',[260 160 60 20],'string',{'r','m','y','g','c','b','k'},'horizontalalignment','center');
    gui.colorText = uicontrol('style','text','position',[200 160 50 20],'string','Color:','horizontalalignment','right');
    %making menus and texts for the colors
    gui.button = uicontrol('style','pushbutton','position',[235 20 100 40],'string','Plot');  %make a plotting pushbutton
    gui.button.String = 'Plot'; %put down the characters Plot
    gui.button.Callback = {@plotDataCallback,gui}; %when pressed, go to its callback
end

function [] = plotDataCallback(~,~,gui) %changed source and event to ~
global gui; %declare global
    gui.titleText.Visible = 'off'; %after pressing plot, do not put this on the screen
    gui.titleEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xDataText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xDataEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yDataText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yDataEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xLabelText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xLabelEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yLabelText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yLabelEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xLimText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.xLimEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yLimText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.yLimEdit.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.typeText.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.typeMenu.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.colorMenu.Visible = 'off';%after pressing plot, do not put this on the screen
    gui.colorText.Visible = 'off';%after pressing plot, do not put this on the screen
    
    gui.button.String = 'Reset'; %reset button
    gui.button.Callback = {@resetCallback,gui}; %gets info from the reset button callback

    gui.fig.Name = gui.titleEdit.String; 
    
    type = 'o'; %type preset to o
    
    switch gui.typeMenu.Value
        case 1
            type = 'o'; %circles
        case 2
            type = 'x'; %xs
        case 3
            type = '*'; %stars
        case 4
            type = '-'; %solid line
        case 5
            type = '--'; %dashed line
    end
    
    color = 'r'; %preset the color to red
    
    switch gui.colorMenu.Value %select the color
        case 1
            color = 'r'; %red
        case 2
            color = 'm'; %magenta
        case 3
            color = 'y'; %yellow
        case 4
            color = 'g'; %green
        case 5
            color = 'c'; %cyan
        case 6
            color = 'b'; %blue
        case 7
            color = 'k'; %black
    end
    
    t = str2num(gui.xDataEdit.String); %t is the x-values, which comes from the x-values from the x data string
    s = str2num(gui.yDataEdit.String); %s is the y-values, which comes from the y-values from the y data string
    str1 = type %string for type
    str2 = color %string for color
    comb = strcat(str1,str2) %combine the strings for the type and the color
    plot(t,s,comb) %plot the x values, y values, type and color
    title('%d\n',char(gui.titleEdit.String));
        xlabel([char(gui.xLabelEdit.String)]);  %make the x label from the characters of the x label string (array)
        ylabel([char(gui.yLabelEdit.String)]);  %make the y label from the characters of the y label string (array)
    xlim(str2num(gui.xLimEdit.String)); %make the x limit from the numbers of the x limit edit string
    ylim(str2num(gui.yLimitEdit.String)); %make the y limit from the numbers of the y limit edit string
end

function [] = resetCallback(~,~,gui)
close all %throw out the old figure
finalProjectGUI() %boot up the initial function
end

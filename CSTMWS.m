classdef CSTMWS < handle
    % CSTMWS - CST Microwave Studio
    %
    % This is just a thin wrapper around the invoke() commands for running
    % CST Microwave Studio via Matlab.  It's only purpose is to increase
    % code readability by getting rid of the endless, unreadable invoke()
    % commands, and also to set my own defaults without cluttering up my
    % code.
    %
    % The "< handle" part of the classdef above ensures pass by reference
    % rather than pass by value of the object, since we don't want to
    % create multiple copies of the objects.
    
    properties (GetAccess='private', SetAccess='private')
        cst;
        mws;
        % Keep a list of all of the VBScript objects created so that we can
        % release them later.
        mwsObjects;
    end
    
    methods
        function hObj = CSTMWS(fname)
            % CSTMWS - The VBScript for CST is much more flexible than this,
            % but I am only interested in running existing files in
            % Microwave Studio.
            hObj.cst = actxserver('CSTStudio.Application');
            hObj.mws = invoke(hObj.cst, 'OpenFile', fname);
        end
        
        function Quit(hObj)
            % When I release all of the objects my script file will be
            % finished, so it is appropriate to put these after a 'Quit'
            % call.
            invoke(hObj.cst, 'Quit');
            %release: release the VBScript objects
            for i=length(hObj.mwsObjects):-1:1
                release(hObj.mwsObjects(i).getCSTObject);
            end
            release(hObj.mws);
            release(hObj.cst);
        end
        
        function Save(hObj)
            % Save the CST file.
            invoke(hObj.mws, 'Save');
        end
        
        function Rebuild(hObj)
            % The same as pressing F7 in CST.
            invoke(hObj.mws, 'Rebuild'); 
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %
        % Methods to create new VBScript objects
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        function solver = FDSolver(hObj)
           solver = CST_FDSolver(hObj.mws); 
           hObj.mwsObjects = [hObj.mwsObjects, solver];
        end
        
        function rtree = ResultTree(hObj)
           rtree = CST_ResultTree(hObj.mws); 
           hObj.mwsObjects = [hObj.mwsObjects, rtree];
        end
        
        function ascii_exp = ASCIIExport(hObj, fname)
           ascii_exp = CST_ASCIIExport(hObj, fname); 
           hObj.mwsObjects = [hObj.mwsObjects, ascii_exp];
        end
        
        function tstone = TOUCHSTONE(hObj, fname)
           tstone = CST_TOUCHSTONE(hObj, fname); 
           hObj.mwsObjects = [hObj.mwsObjects, tstone];
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %
        % Methods to set parameters etc
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        function StoreDoubleParameter(hObj, param_name, param_value)
            invoke(hObj.mws, 'StoreDoubleParameter',...
                param_name, param_value);
        end
        
        function SelectTreeItem(hObj, child_name) 
            invoke(hObj.mws, 'SelectTreeItem' , child_name);
        end
    end
end


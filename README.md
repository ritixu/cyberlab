CyberLab is a environment where ethical hacker and web penitration testers can test Vunerable apps in a isolated Environment.


Architecture:

User uses Cli -> Controller (Checks prereqs and ports and cordinates accordingly) -> Lab config (defines ports,networks and health check) -> Docker engine (creates and manages lab's containers and network)-> practice app and verification.

Commands to use:

Options: 
-h, --help Show this help message and exit 
-v, --version Show version information and exit 
 
Commands: 
 
cyberlab     	            help to use cyberlab 
cyberlab list labs       	Show available practice labs 
cyberlab list-containers    Show containers running 
cyberlab up [lab_name]      Start the selected lab 
cyberlab up dvwa            Start the selected lab dvwa 
cyberlab status	            Show running services and health 
cyberlab logs	            Display relevant container logs 
cyberlab stop	  	        Stop the lab without deleting its configuration 
cyberlab down	         	Stop the environment and remove its managed containers and network 
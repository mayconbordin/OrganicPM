OrganicPM - People Management System
Copyright (C) 2010  5º Semestre de Sistemas de Informação - SETREM
==================================================================

LICENSE:

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

==================================================================

REQUIREMENTS:

1. PHP 5.* or greater;
2. Apache HTTP Server;
3. Oracle 10g (development version, other versions are at your own risk);

==================================================================

INSTALLATION:

1. Edit the 'config.inc.php' file in the folder './cofig'
2. Change the values of the three first constants (DB_USERNAME, DB_PASSWORD and DB_CONNECTION_STRING);
3. Also changes the ROOT constant, set this to the root file where the system is located;
4. Import the file 'banco.SQL' in folder './SQL' to your database an then the file 'dados.SQL';
5. Now you're done!
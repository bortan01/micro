#include"stdio.h"
#include"conio.h"
#include"string.h"

void arch(),mdirec(),borrar(),marchivo(),copiar(),crear(),crearD(),abrir(),borrarD(),color1();
void menu();
char opc;
int band,band2;

void main(void){
clrscr();
textcolor(BLUE);
textbackground(WHITE);

printf("\t\tษออออออออออออออออออออออออออออออออออออออออออออป\n");
printf("\t\tบ       UNIVERSIDAD DE EL SALVADOR           บ\n");
printf("\t\tบ   FACULTAD MULTIDISCIPLINARIA PARACENTARL  บ\n");
printf("\t\tบ       DEPARTAMENTO DE INFORMATICA          บ\n");
printf("\t\tบ      PROYECTO FINAL DE MICROROGRAMACION    บ\n");
printf("\t\tศออออออออออออออออออออออออออออออออออออออออออออผ\n\n");

printf("\t\t\tษออออออออออออออออออออออออออออออออป\n");
printf("\t\t\tบ     INTERGRANTES               บ\n");
printf("\t\t\tศออออออออออออออออออออออออออออออออผ");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tบÜÜÜษออออออออออออออออออออออออออออออออออออออปÜÜÜบ");
printf("\n\t\tบÜÜÜบ         Jenifer Joana Abarca         บÜÜÜบ");
printf("\n\t\tบÜÜÜบ      Moises Amilcar Chavez Cortez    บÜÜÜบ");
printf("\n\t\tบÜÜÜบ     Kelyn Marielos Flores Hernandez  บÜÜÜบ");
printf("\n\t\tบÜÜÜศออออออออออออออออออออออออออออออออออออออผÜÜÜบ");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tศออออออออออออออออออออออออออออออออออออออออออออออผ");

printf("\n\tdesea ir al menu pricipal: N-no y S-si: \n");
scanf("%c",&opc);
clrscr();
if(opc=='S'|| opc=='s'){
clrscr();
menu();

}
getch();

}

void menu(){
clrscr();

band=1;
while(band==1){
clrscr();

printf("\n\t\t\tบ    MENU PRINCIPAL             บ\n");
printf("\t\t\tศออออออออออออออออออออออออออออออออผ\n\n");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tบÜÜÜษออออออออออออออออออออออออออออออออออออออปÜÜÜบ");
printf("\n\t\tบÜÜÜบ                                      บÜÜÜบ");
printf("\n\t\tบÜÜÜบ                                      บÜÜÜบ");
printf("\n\t\tบÜÜÜบ         [1] Directorios              บÜÜÜบ");
printf("\n\t\tบÜÜÜบ         [2] Archivos                 บÜÜÜบ");
printf("\n\t\tบÜÜÜบ         [3] Paleta de colorres       บÜÜÜบ");
printf("\n\t\tบÜÜÜบ         [4] Salir                    บÜÜÜบ");
printf("\n\t\tบÜÜÜบ                                      บÜÜÜบ");
printf("\n\t\tบÜÜÜบ                                      บÜÜÜบ");
printf("\n\t\tบÜÜÜศออออออออออออออออออออออออออออออออออออออผÜÜÜบ");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tศออออออออออออออออออออออออออออออออออออออออออออออผ");


printf("\n\t\tบ    Seleccione una opcion      บ\n");
printf("\t\tศออออออออออออออออออออออออออออออออผ\n");

scanf("%c",&opc);

switch(opc){
case '1':
      clrscr();
      mdirec();
      getch();
      break;

case '2':
 clrscr();
 marchivo();
 getch();
 break;

case '3':
 clrscr();
 color1();
 getch();
 break;

case '4':
	clrscr();
	band=0;
	break;

default:
clrscr();
printf("Selecion erronea, intente nuevamente");

}

}
getch();
}

void arch(){
return;
}

void mdirec(){
clrscr();

band2=1;
while(band2==1){
clrscr();
textcolor(RED);


printf("\t\t\t\tบ     MENU DE DIRECTORIOS      บ\n\n");
printf("\t\t\tศออออออออออออออออออออออออออออออออผ\n\n");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tบÜÜÜษออออออออออออออออออออออออออออออออออออออปÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [1] Crear Directirio           บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [2] Borrar Directorio          บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [3] Salir                      บÜÜÜบ");
printf("\n\t\tบÜÜÜศออออออออออออออออออออออออออออออออออออออผÜÜÜบ");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tศออออออออออออออออออออออออออออออออออออออออออออออผ");

printf("\n\nษอออIMPORTANTEอออออออออออออออออออออออออออออออออออออออออออออออป\n");
printf("บ Para cualquier opcion debera escribir la direccion             บ\n");
printf("บ de la siguiente manera para no cometer error:                  บ\n");
printf("บ C:/users/nomdre_del Admisnistrador/posicion/nombre_del archivo บ\n");
printf("บ  por ejemplo:                                                  บ\n");
printf("บ C:/users/KELLY/desktop/Archivo                                 บ\n");
printf("ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ\n\n");

printf("\n\t\t\tDigite la opcion: ");
scanf("%c",&opc);
switch(opc){
case '1':
clrscr();
crearD();
break;

case '2':
    clrscr();
    borrarD();
    break;

case '3':
     band2=0;
     break;

default:
  clrscr();
  printf("seleccion erronea, intente nuevamente");

} /*llave que finaliza el switch */

} /*llave que finaliza el while /**/

}  /*llave que finaliza la funcion /**/

void marchivo(){
clrscr();

band2=1;
while(band2==1){
clrscr();
textcolor(RED);


printf("\t\t\t\tบ     MENU DE ARCHIVOS         บ\n\n");
printf("\t\t\tศออออออออออออออออออออออออออออออออผ\n\n");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tบÜÜÜษออออออออออออออออออออออออออออออออออออออปÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [1] Crear Archivos             บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [2] Borrar Archivos            บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [3] Abrir archivos             บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [4] Copiar Archivos            บÜÜÜบ");
printf("\n\t\tบÜÜÜบ       [5] Salir                      บÜÜÜบ");
printf("\n\t\tบÜÜÜศออออออออออออออออออออออออออออออออออออออผÜÜÜบ");
printf("\n\t\tบÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜบ");
printf("\n\t\tศออออออออออออออออออออออออออออออออออออออออออออออผ");



printf("\n\t\t\tDigite la opcion: ");
scanf("%c",&opc);
switch(opc){

case '1':
     clrscr();
     crear();
     break;

case '2':
     clrscr();
     borrar();
     break;

case '3':
     clrscr();
     abrir();
     break;

case '4':
     clrscr();
     copiar();
     break;

case '5':
     band2=0;
     break;

default:
  clrscr();
  printf("seleccion erronea, intente nuevamente");


} /*llave que finaliza el switch */

} /*llave que finaliza el while /**/

}  /*llave que finaliza la funcion /**/
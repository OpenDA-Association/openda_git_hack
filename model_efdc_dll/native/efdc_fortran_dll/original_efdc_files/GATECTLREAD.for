! Advanced EFDC Hydraulic structure ! GEOSR. 2011. 12. JGCHO
!
      SUBROUTINE GATECTLREAD
C  
C GEOSR 2010.5.7
C **  SUBROUTINE GATECTLREAD
C **  READ FROM GATECTL.INP FILE
C **  GATE INFORMATION AND CONTROL ENVIROMENT 
C  
      USE GLOBAL  

! { GEOSR ESTURAY DIKE : JGCHO 2010.11.16
      REAL JULDAY,AJULDAY(NGTYPES),YEARTMP
      INTEGER NTIDE
      CHARACTER*80 FNTIDE
      CHARACTER*3 NCARD
      AJULDAY=0.
! } GEOSR ESTURAY DIKE : JGCHO 2010.11.16

      OPEN(1,FILE='GATECTL.INP',STATUS='UNKNOWN')  

C GC1**  NUMBER OF GATE TYPE
      NCARD='1'
      CALL SEEK('GC1')
      READ(1,*,ERR=1000) NGTYPES,GARTM,IWSYS
      WRITE(7,1002)NCARD
      WRITE(7,*) NGTYPES,GARTM,IWSYS
C
C GC2**  READ GATE INFORMATION 1
      NCARD='2'  
      CALL SEEK('GC2')  
      DO L=1,NQCTL
        READ(1,*,ERR=1000) NGATEM(L),NGATEC(L),NGTYP(L) ! GEOSR JGCHO 2011.10.27 NGATE(L),NGATEC(L),NGTYP(L)
        WRITE(7,1002)NCARD
        WRITE(7,*) NGATEM(L),NGATEC(L),NGTYP(L) ! GEOSR JGCHO 2011.10.27 NGATE(L),NGATEC(L),NGTYP(L)
      ENDDO
C
C GC3** READ GATE INFORMATION 2
      NCARD='3'
      CALL SEEK('GC3')
      DO L=1,NGTYPES
        READ(1,*,ERR=1000) SILL(L),SILLHH(L),GATEHI(L),GATEHO(L)
     &                    ,GATEWI(L),GATEWO(L),MAXQ(L)
     &                    ,GOTIME(L),GCTIME(L)
        WRITE(7,1002)NCARD
        WRITE(7,*) SILL(L),SILLHH(L),GATEHI(L),GATEHO(L)
     &            ,GATEWI(L),GATEWO(L),MAXQ(L),GOTIME(L),GCTIME(L)
      ENDDO
C
C GC4** READ FLOW CONSTANT
      NCARD='4'
      CALL SEEK('GC4')
      DO L=1,NGTYPES
        READ(1,*,ERR=1000) CGH1(L),CGH2(L),CG1(L),CG2(L),CG3(L),CG4(L)			!ung 20141108
     &  ,CG5(L),CG6(L),CG7(L),CG8(L),NCG3FOM(L)															!ung 20141108
        WRITE(7,1002)NCARD
        WRITE(7,*) CGH1(L),CGH2(L),CG1(L),CG2(L),CG3(L),CG4(L)							!ung 20141108
     &  ,CG5(L),CG6(L),CG7(L),CG8(L),NCG3FOM(L),L														!ung 20141108
      ENDDO
C
C GC5** READ GATE CONTROL
      NCARD='5'
      CALL SEEK('GC5')
      DO L=1,NGTYPES
        READ(1,*,ERR=1000) DELHINOUT(L),DELHSEL1(L)
     &                    ,DUM,DUM,TIDCHK(L) ! GEOSR JGCHO 2011.10.27 SEL1, 2(L) -> DUM
        WRITE(7,1002)NCARD
        WRITE(7,*) DELHINOUT(L),DELHSEL1(L),DUM,DUM ! GEOSR JGCHO  SEL1, 2(L) -> DUM
     &            ,TIDCHK(L),L
      ENDDO
C
C GC6** NUMBER OF SURFACE LEVEL COMPARE CELL
      NCARD='6'
      CALL SEEK('GC6')
      DO L=1,NGTYPES
        READ(1,*,ERR=1000) NICMP(L),NOCMP(L)
        WRITE(7,1002)NCARD
        WRITE(7,*) NICMP(L),NOCMP(L),L
      ENDDO
C
C GC7** CELL INDEX OF UPSTREAM
      NCARD='7'
      CALL SEEK('GC7')
      DO L=1,NGTYPES
        DO LL=1,NICMP(L)
          READ(1,*,ERR=1000) ICMPI(LL,L),JCMPI(LL,L)
          WRITE(7,1002)NCARD
          WRITE(7,*) ICMPI(LL,L),JCMPI(LL,L),L
        ENDDO
      ENDDO
C
C GC8** CELL INDEX OF DOWNSTREAM
      NCARD='8'
      CALL SEEK('GC8')
      DO L=1,NGTYPES
        DO LL=1,NOCMP(L)
          READ(1,*,ERR=1000) ICMPO(LL,L),JCMPO(LL,L)
          WRITE(7,1002)NCARD
          WRITE(7,*) ICMPO(LL,L),JCMPO(LL,L),L
        ENDDO
      ENDDO
! { GEOSR ESTURAY DIKE : JGCHO 2010.11.15
C
C GC9** CONSIDER ESTUARY DIKE OUTER TIDE START TIME
      NCARD='9'
      CALL SEEK('GC9')
      DO L=1,NGTYPES
        READ(1,*,ERR=1000) IGYY(L),IGMM(L),IGDD(L),CLOC(L)
        WRITE(7,1002)NCARD
        WRITE(7,*) IGYY(L),IGMM(L),IGDD(L),CLOC(L),L
      ENDDO
! } GEOSR ESTURAY DIKE : JGCHO 2010.11.15
C
C GC10** GATE FLUX MONITORING
      NCARD='10'
      CALL SEEK('GC10')
      READ(1,*,ERR=1000) ISINK,DTSNK
      WRITE(7,1002)NCARD
      WRITE(7,*) ISINK,DTSNK
C
      CLOSE(1)
C
      GOTO 1003
C  
 1000 WRITE(6,1001)  
 1001 FORMAT('  READ ERROR ON FILE GATECTL.INP ')  
      STOP
 1002 FORMAT(/,'INPUT ECHO NCARD = ',A/)  
C
 1003 CONTINUE

! { GEOSR ESTURAY DIKE : JGCHO 2010.11.16
      DO L=1,NGTYPES
        IF (IGYY(L).GE.0) THEN
          ! { GEOSR ESTURAY DIKE, READ DATE : JGCHO 2010.11.26
          IF (IDTOX.GE.0) THEN 
            OPEN(7501,FILE='EVENT_TOX2.INP')
            READ(7501,*) ISYEAR,ISMONTH,ISDATE,ISHR,ISMN  ! MODEL START TIME
            CLOSE(7501)
            CALL JULD(ISYEAR,ISMONTH,ISDATE,0,0,JULDAY)
          ELSE
            CALL JULD(IGYY(L),IGMM(L),IGDD(L),0,0,JULDAY)
            ISYEAR=IGYY(L)
            ISMONTH=IGMM(L)
            ISDATE=IGDD(L)
          ENDIF
          ! } GEOSR ESTURAY DIKE, READ DATE : JGCHO 2010.11.26
          AJULDAY(L)=JULDAY
!!!!!!!!!! READ PREDICTION TIDE LEVEL : START
          YEARTMP=FLOAT(ISYEAR)*0.1
          IF ( YEARTMP-FLOAT(INT(YEARTMP)).GE.0.1 
     &       .AND. YEARTMP-FLOAT(INT(YEARTMP)).LT.0.5 ) THEN
            YEARTMP=NINT(YEARTMP+0.5)*10.
          ELSE
            YEARTMP=NINT(YEARTMP)*10.
          ENDIF
          WRITE(FNTIDE,'(A,I4.4,A)') TRIM(CLOC(L)),INT(YEARTMP),'.INP'
          WRITE(*,*) 'READING PREDICTION TIDE DATA : ', TRIM(FNTIDE)
          WRITE(7,*) 'READING PREDICTION TIDE DATA : ', TRIM(FNTIDE)

          NTIDE=0
          OPEN(1,FILE=TRIM(FNTIDE))          
          READ(1,*)
 7000     READ(1,*,ERR=7001,END=7001) IY,ID,HH,TIDETMP
          IF ( IY.EQ.ISYEAR .AND. FLOAT(ID).GE.AJULDAY(L) ) THEN
            NTIDE=NTIDE+1
            ! { GEOSR ESTURAY DIKE, READ DATE : JGCHO 2010.11.26
            IF (IDTOX.GE.0) THEN 
              ESTIME(L,NTIDE)=FLOAT(ID)+HH/24.
            ELSE
              ESTIME(L,NTIDE)=FLOAT(ID)+HH/24.-AJULDAY(L)
            ENDIF
            ! } GEOSR ESTURAY DIKE, READ DATE : JGCHO 2010.11.26
            ESTIDE(L,NTIDE)=TIDETMP
            WRITE(7,*) ESTIME(L,NTIDE),ESTIDE(L,NTIDE),IY,ID,HH
            IF (NTIDE .EQ. (NTC+1)*24+1) THEN
              CLOSE(1)
              GOTO 7003
            ENDIF
          ENDIF
          GOTO 7000
 7001     WRITE(6,7002)  
 7002     FORMAT('  READ ERROR ON FILE PREDICTION TIDE FILE ')  
          STOP
!!!!!!!!!! READ PREDICTION TIDE LEVEL : END
        ENDIF
      ENDDO

! } GEOSR ESTURAY DIKE : JGCHO 2010.11.16
 7003 CONTINUE

      RETURN  
      END  

! { GEOSR JULIAN DAY : JGCHO 2010.11.16
      SUBROUTINE JULD(IY,IM,ID,IH,MN,JULDAY)
      INTEGER IY,IM,ID,IH,MN
      REAL DAY(12),JULDAY
      DATA DAY/31.,28.,31.,30.,31.,30.,31.,31.,30.,31.,30.,31./

      IF ( MOD(IY,4).EQ.0 .AND. (MOD(IY,100).NE.0
     & .OR. MOD(IY,400).EQ.0) ) THEN 
        DAY(2)=29. 
      ENDIF

      JULDAY=0. 

      IF (IM-1.EQ.0) THEN 
        JULDAY=0.
      ELSE !IF (IM-1.EQ.0) THEN 
        DO I=1,IM-1 
          JULDAY=JULDAY+DAY(I) 
        ENDDO
      ENDIF !IF (IM-1.EQ.0) THEN
      JULDAY=JULDAY+FLOAT(ID) + (FLOAT(IH)/24.) + (FLOAT(MN)/1440.)

      RETURN
      END
! } GEOSR JULIAN DAY : JGCHO 2010.11.16

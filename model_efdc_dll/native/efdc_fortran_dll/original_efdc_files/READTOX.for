      SUBROUTINE READTOX
C
C GEOSR 2010.11.02
C
C ** READ THE TOXIC DECAY COEFF.
C 
      USE GLOBAL 
      CHARACTER*20 TXNAME


      OPEN(1,FILE='TOX1.INFO',STATUS='UNKNOWN')

      DO NDUM=1,10
        READ(1,*)
      ENDDO
      READ(1,*) FPOCWI,FPOCBI,ISTOXB

      NTMP=NSED+NSND  
      DO NS=1,NTMP
      DO NT=1,NTOX
       FPOCWST(NS,NT)=FPOCWI
       FPOCBST(NS,NT)=FPOCBI
      ENDDO
      ENDDO

      DO NDUM=1,7
        READ(1,*)
      ENDDO
      READ(1,*) ISTXD1ST,TX1ST

      DO NDUM=1,9
        READ(1,*)
      ENDDO
      READ(1,*) ISTXDCV,ISTXKLL,TXSC,ISTXKL

      DO NDUM=1,7
        READ(1,*)
      ENDDO
      READ(1,*) ISTXDCH,TXKH

      DO NDUM=1,13
        READ(1,*)
      ENDDO
      READ(1,*) ISTXDCP,TXKDO,TXD,TXD0,TXAW,TXAA,TXAC,TXAS
!{ GeoSR, YSSONG, COMMENTOUT 2014.09.16
C      TXAW=TXAW*0.000000001
C	TXAA=TXAA*0.000000001
C	TXAC=TXAC*0.000000001
C	TXAS=TXAS*0.000000001
!}

      DO NDUM=1,8
        READ(1,*)
      ENDDO
      READ(1,*) ISTXDCB,TXKB,TXTHETA

      CLOSE(1)

C
C** READ TOXIC COEFF.
C
      OPEN(1,FILE='TOX2.INFO',STATUS='UNKNOWN')

      DO NDUM=1,27
        READ(1,*)
      ENDDO
      NTXID=0
 1000 READ(1,*,END=1001) TXID,ISOCTX,TXNAME,TXSG,TXPAR,TXMW,TXHE,TXI0

      TXPAR=TXPAR*0.000001

      DO NT=1,NTOX   ! PARTITION COEFF FOR ONLY 1 SEDIMENT CLASS
        IF(NSED.GT.0)THEN  
          DO N=1,NSED
            TOXPARW(N,NT)=TXPAR
            TOXPARB(N,NT)=TXPAR
            ITXPARW(N,NT)=ISOCTX
          ENDDO
        ENDIF
  
        IF(NSND.GT.0)THEN  
          DO NX=1,NSND
            N=NX+NSED
            TOXPARW(N,NT)=TXPAR
            TOXPARB(N,NT)=TXPAR
            ITXPARW(N,NT)=ISOCTX
          ENDDO
        ENDIF
      ENDDO

C      IF(ID.EQ.IDTOX)THEN
      IF(TXID.EQ.TXID0)THEN  ! TXID : TOXIC ID FROM EVENT_TOX2.INP
       OPEN(2,FILE='TOXEVENT.LOG',STATUS='UNKNOWN',POSITION='APPEND')
       WRITE(2,8999) 
       WRITE(2,8998) TXNAME,TXSG,TXPAR,TXMW,TXHE,TXI0
 8999  FORMAT('TOXIC MATERIAL INFO. :  NAME                SGRAV  PART_C
     &   MOLE_WGHT     HE         I0')
 8998  FORMAT('                     :',
     &         2X,A20,F5.2,1X,F7.4,4X,F6.2,1X,E12.4,1X,F7.1)
       CLOSE(2)
       NTXID=1
       GOTO 1001
      ENDIF



      GOTO 1000
 1001 CONTINUE

      IF(NTXID.EQ.0)THEN
       WRITE(*,8995)
       WRITE(*,8996)
       WRITE(*,8997)
 8995  FORMAT(//,'**********************  ERROR  *********************')
 8996  FORMAT('TOXIC ID IS INCONSISTENT WITH TOXIC LIST (TOX2.INFO)')
 8997  FORMAT('**********************  ERROR  *********************',//)
       STOP
	ENDIF

      RETURN
      END
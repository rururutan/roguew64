TARGET = rouge
SRCDIR=.\src
OUTDIR=.\obj
LINK=link.exe
CFLAGS = -nologo -MT -O2 -W3 -DNDEBUG
LDFLAGS = -nologo
LIBS = user32.lib gdi32.lib comdlg32.lib shell32.lib
OBJS =\
	$(OUTDIR)\AppMain.obj\
	$(OUTDIR)\init.obj\
	$(OUTDIR)\machdep.obj\
	$(OUTDIR)\move.obj\
	$(OUTDIR)\play.obj\
	$(OUTDIR)\room.obj\
	$(OUTDIR)\spechit.obj\
	$(OUTDIR)\use.obj\
	$(OUTDIR)\curses.obj\
	$(OUTDIR)\invent.obj\
	$(OUTDIR)\message.obj\
	$(OUTDIR)\object.obj\
	$(OUTDIR)\random.obj\
	$(OUTDIR)\save.obj\
	$(OUTDIR)\throw.obj\
	$(OUTDIR)\zap.obj\
	$(OUTDIR)\hit.obj\
	$(OUTDIR)\level.obj\
	$(OUTDIR)\monster.obj\
	$(OUTDIR)\pack.obj\
	$(OUTDIR)\ring.obj\
	$(OUTDIR)\score.obj\
	$(OUTDIR)\trap.obj\
	$(OUTDIR)\Resource.res

all:	$(OUTDIR)\$(TARGET).exe

clean:
	-@erase /Q $(OUTDIR)\*

$(OUTDIR):
	@if not exist $(OUTDIR) mkdir $(OUTDIR)

{$(SRCDIR)}.c{$(OUTDIR)}.obj:
	$(CPP) $(CPPFLAGS) -Fo$@ -c $<
{$(SRCDIR)}.rc{$(OUTDIR)}.res:
	$(RC) -l 0x411 -fo $@ $<

$(OUTDIR)\$(TARGET).exe: $(OUTDIR) $(OBJS)
	$(LINK) $(LDFLAGS) -out:$@ $(LIBS) $(OBJS)
	mt.exe -manifest $(SRCDIR)\$(TARGET).exe.manifest -outputresource:$(OUTDIR)\$(TARGET).exe;1


.class public Lcom/boyaa/engine/made/GhostLib;
.super Ljava/lang/Object;
.source "GhostLib.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "lua"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 25
    const-string v0, "tolua"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    const-string v0, "babe"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native callLua(Ljava/lang/String;)I
.end method

.method public static native callLuaIdWithArgs(ILjava/lang/String;)I
.end method

.method public static native callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native create(II)V
.end method

.method public static native dictDelete(Ljava/lang/String;)I
.end method

.method public static native dictGetDouble(Ljava/lang/String;Ljava/lang/String;D)I
.end method

.method public static native dictGetInt(Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method public static native dictGetString(Ljava/lang/String;Ljava/lang/String;)[B
.end method

.method public static native dictSave(Ljava/lang/String;)I
.end method

.method public static native dictSetDouble(Ljava/lang/String;Ljava/lang/String;D)I
.end method

.method public static native dictSetInt(Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method public static native dictSetString(Ljava/lang/String;Ljava/lang/String;[B)I
.end method

.method public static native onImeClosed([BI)I
.end method

.method public static native onKeyDown(I)V
.end method

.method public static native onLowMemory()V
.end method

.method public static native onPause()V
.end method

.method public static native onResume()V
.end method

.method public static native onTouchCancel(FFJ)V
.end method

.method public static native onTouchDown(FFJ)V
.end method

.method public static native onTouchMove(FFJFF)V
.end method

.method public static native onTouchUp(FFJ)V
.end method

.method public static native releaseLuaId(I)I
.end method

.method public static native retainLuaId(I)I
.end method

.method public static native setOrientation(I)V
.end method

.method public static native sysGetDouble(Ljava/lang/String;D)D
.end method

.method public static native sysGetInt(Ljava/lang/String;I)I
.end method

.method public static native sysGetString(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native sysSetDouble(Ljava/lang/String;D)I
.end method

.method public static native sysSetInt(Ljava/lang/String;I)I
.end method

.method public static native sysSetString(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native update()Z
.end method

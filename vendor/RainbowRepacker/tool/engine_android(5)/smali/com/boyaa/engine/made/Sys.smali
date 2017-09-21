.class public Lcom/boyaa/engine/made/Sys;
.super Ljava/lang/Object;
.source "Sys.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static callLua(Ljava/lang/String;)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->checkThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    const/4 v0, -0x1

    .line 79
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Lcom/boyaa/engine/made/GhostLib;->callLua(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static getDouble(Ljava/lang/String;D)D
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # D

    .prologue
    .line 55
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/made/GhostLib;->sysGetDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static getInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 46
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/GhostLib;->sysGetInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0}, Lcom/boyaa/engine/made/GhostLib;->sysGetString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static setDouble(Ljava/lang/String;D)I
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # D

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/made/GhostLib;->sysSetDouble(Ljava/lang/String;D)I

    move-result v0

    return v0
.end method

.method public static setInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # I

    .prologue
    .line 17
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/GhostLib;->sysSetInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static setString(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/GhostLib;->sysSetString(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

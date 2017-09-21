.class public Lcom/boyaa/engine/made/Dict;
.super Ljava/lang/Object;
.source "Dict.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static erase(Ljava/lang/String;)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-static {p0}, Lcom/boyaa/engine/made/GhostLib;->dictDelete(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getDouble(Ljava/lang/String;Ljava/lang/String;D)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # D

    .prologue
    .line 65
    invoke-static {p0, p1, p2, p3}, Lcom/boyaa/engine/made/GhostLib;->dictGetDouble(Ljava/lang/String;Ljava/lang/String;D)I

    move-result v0

    return v0
.end method

.method public static getInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 54
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/made/GhostLib;->dictGetInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 75
    .local v0, "str":[B
    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    .line 76
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    .line 79
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public static save(Ljava/lang/String;)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-static {p0}, Lcom/boyaa/engine/made/GhostLib;->dictSave(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static setDouble(Ljava/lang/String;Ljava/lang/String;D)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 30
    invoke-static {p0, p1, p2, p3}, Lcom/boyaa/engine/made/GhostLib;->dictSetDouble(Ljava/lang/String;Ljava/lang/String;D)I

    move-result v0

    return v0
.end method

.method public static setInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 20
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/made/GhostLib;->dictSetInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "dictName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 40
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 41
    :cond_0
    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Lcom/boyaa/engine/made/GhostLib;->dictSetString(Ljava/lang/String;Ljava/lang/String;[B)I

    move-result v1

    .line 44
    :goto_0
    return v1

    .line 43
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 44
    .local v0, "barr":[B
    invoke-static {p0, p1, v0}, Lcom/boyaa/engine/made/GhostLib;->dictSetString(Ljava/lang/String;Ljava/lang/String;[B)I

    move-result v1

    goto :goto_0
.end method

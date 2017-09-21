.class public Lcom/boyaa/engine/patchupdate/PatchUpdate;
.super Ljava/lang/Object;
.source "PatchUpdate.java"


# static fields
.field private static loadLibrary:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 7
    sput-boolean v2, Lcom/boyaa/engine/patchupdate/PatchUpdate;->loadLibrary:Z

    .line 10
    :try_start_0
    const-string v1, "patchupdate"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 11
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/patchupdate/PatchUpdate;->loadLibrary:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 12
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 14
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 15
    sput-boolean v2, Lcom/boyaa/engine/patchupdate/PatchUpdate;->loadLibrary:Z

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native bspatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static bspatchUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "oldApkPath"    # Ljava/lang/String;
    .param p1, "newApkPath"    # Ljava/lang/String;
    .param p2, "patch"    # Ljava/lang/String;

    .prologue
    .line 20
    const/4 v0, -0x1

    .line 21
    .local v0, "code":I
    sget-boolean v1, Lcom/boyaa/engine/patchupdate/PatchUpdate;->loadLibrary:Z

    if-eqz v1, :cond_0

    .line 22
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/patchupdate/PatchUpdate;->bspatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 24
    :cond_0
    return v0
.end method

.method public static load()V
    .locals 0

    .prologue
    .line 31
    return-void
.end method

.class final Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util$1;
.super Ljava/lang/Object;
.source "ApkMerge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->startVerify()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$filePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 196
    iput-object p1, p0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util$1;->val$filePath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 199
    const-string v0, "verifyMD5"

    const-string v1, "result"

    # getter for: Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->result:I
    invoke-static {}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->access$100()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 200
    const-string v0, "verifyMD5"

    const-string v1, "filePathCallback"

    iget-object v2, p0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util$1;->val$filePath:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    const-string v0, "event_verify_md5"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 202
    return-void
.end method

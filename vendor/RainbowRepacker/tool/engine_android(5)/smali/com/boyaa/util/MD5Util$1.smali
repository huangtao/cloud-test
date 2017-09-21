.class Lcom/boyaa/util/MD5Util$1;
.super Ljava/lang/Object;
.source "MD5Util.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/MD5Util;->startVerify()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 60
    const-string v0, "verifyMD5"

    const-string v1, "result"

    # getter for: Lcom/boyaa/util/MD5Util;->result:I
    invoke-static {}, Lcom/boyaa/util/MD5Util;->access$0()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 61
    const-string v0, "event_verify_md5"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    .line 62
    return-void
.end method

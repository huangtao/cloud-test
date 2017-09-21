.class Lcom/boyaa/autotest/ElementProvider1$2;
.super Ljava/lang/Object;
.source "ElementProvider1.java"

# interfaces
.implements Lcom/boyaa/engine/made/CallLuaHelper$onCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/autotest/ElementProvider1;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider1;


# direct methods
.method constructor <init>(Lcom/boyaa/autotest/ElementProvider1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider1$2;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback()V
    .locals 5

    .prologue
    .line 117
    const-string v3, "Elements"

    const-string v4, "getNodesByXPath"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    .line 118
    .local v1, "result1":[B
    if-nez v1, :cond_0

    .line 119
    const-string v3, "testsupport"

    const-string v4, "1111111111111111111111"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    :goto_0
    return-void

    .line 122
    :cond_0
    const-string v3, "testsupport"

    const-string v4, "2222222222222222222222"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 124
    .local v0, "result":Ljava/lang/String;
    const-string v3, "testsupport"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    .line 126
    .local v2, "tableCursor1":[Ljava/lang/String;
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider1$2;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    new-instance v4, Landroid/database/MatrixCursor;

    invoke-direct {v4, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v4, v3, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    goto :goto_0
.end method

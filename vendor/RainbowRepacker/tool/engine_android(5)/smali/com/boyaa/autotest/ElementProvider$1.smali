.class Lcom/boyaa/autotest/ElementProvider$1;
.super Ljava/lang/Object;
.source "ElementProvider.java"

# interfaces
.implements Lcom/boyaa/engine/made/CallLuaHelper$onCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/autotest/ElementProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider;


# direct methods
.method constructor <init>(Lcom/boyaa/autotest/ElementProvider;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider$1;->this$0:Lcom/boyaa/autotest/ElementProvider;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 76
    const-string v3, "Elements"

    const-string v4, "getHierarchy"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    .line 77
    .local v1, "result1":[B
    if-nez v1, :cond_0

    .line 78
    const-string v3, "testsupport"

    const-string v4, "GET_HIERARCHY1"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :goto_0
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider$1;->this$0:Lcom/boyaa/autotest/ElementProvider;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/autotest/ElementProvider;->access$0(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/Boolean;)V

    .line 88
    return-void

    .line 81
    :cond_0
    const-string v3, "testsupport"

    const-string v4, "GET_HIERARCHY2"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 83
    .local v0, "result":Ljava/lang/String;
    const-string v3, "testsupport"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-array v2, v5, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    .line 85
    .local v2, "tableCursor1":[Ljava/lang/String;
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider$1;->this$0:Lcom/boyaa/autotest/ElementProvider;

    new-instance v4, Landroid/database/MatrixCursor;

    invoke-direct {v4, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v4, v3, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    goto :goto_0
.end method

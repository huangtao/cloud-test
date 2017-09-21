.class Lcom/boyaa/autotest/ElementProvider1$4;
.super Ljava/lang/Object;
.source "ElementProvider1.java"

# interfaces
.implements Lcom/boyaa/engine/made/CallLuaHelper$onCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/autotest/ElementProvider1;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
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
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider1$4;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback()V
    .locals 3

    .prologue
    .line 195
    const-string v1, "Elements"

    const-string v2, "setElementText"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 196
    .local v0, "result1":[B
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "true"

    if-ne v1, v2, :cond_0

    .line 197
    iget-object v1, p0, Lcom/boyaa/autotest/ElementProvider1$4;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    const/4 v2, 0x0

    iput v2, v1, Lcom/boyaa/autotest/ElementProvider1;->returnInt:I

    .line 201
    :goto_0
    return-void

    .line 199
    :cond_0
    iget-object v1, p0, Lcom/boyaa/autotest/ElementProvider1$4;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    const/4 v2, 0x1

    iput v2, v1, Lcom/boyaa/autotest/ElementProvider1;->returnInt:I

    goto :goto_0
.end method

.class Lcom/boyaa/engine/made/AppActivity$AppHandler$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppActivity$AppHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppActivity$AppHandler;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppActivity$AppHandler;I)V
    .locals 0

    .prologue
    .line 246
    iput-object p1, p0, Lcom/boyaa/engine/made/AppActivity$AppHandler$1;->this$0:Lcom/boyaa/engine/made/AppActivity$AppHandler;

    iput p2, p0, Lcom/boyaa/engine/made/AppActivity$AppHandler$1;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 249
    const-string v0, "SystemTimer"

    const-string v1, "Id"

    iget v2, p0, Lcom/boyaa/engine/made/AppActivity$AppHandler$1;->val$id:I

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 250
    const-string v0, "event_system_timer"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 251
    return-void
.end method

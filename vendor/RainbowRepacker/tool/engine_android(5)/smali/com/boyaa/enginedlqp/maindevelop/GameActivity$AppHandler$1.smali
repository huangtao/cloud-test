.class Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler$1;->this$1:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;

    .line 462
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 465
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->terminateProcess()V

    .line 466
    return-void
.end method

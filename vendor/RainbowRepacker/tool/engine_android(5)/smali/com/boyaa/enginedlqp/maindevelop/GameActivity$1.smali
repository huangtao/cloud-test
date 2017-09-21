.class Lcom/boyaa/enginedlqp/maindevelop/GameActivity$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$1;->this$0:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/boyaa/engine/made/GhostLib;->setOrientation(I)V

    .line 84
    return-void
.end method

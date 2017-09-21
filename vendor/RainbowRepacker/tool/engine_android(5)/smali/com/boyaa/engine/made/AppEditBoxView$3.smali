.class final Lcom/boyaa/engine/made/AppEditBoxView$3;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->updateIMEEdit()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 135
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    if-eqz v0, :cond_0

    .line 136
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->update()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$200(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 137
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->setFocus()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$300(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 139
    :cond_0
    return-void
.end method

.class public interface abstract Lcom/boyaa/godsdk/core/IIAPPlugin;
.super Ljava/lang/Object;
.source "IIAPPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getDefaultPmode()Ljava/lang/String;
.end method

.method public abstract getSupportingPmodes()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract requestPay(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract requestPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setIAPListener(Lcom/boyaa/godsdk/callback/IAPListener;)V
.end method
